package com.roslin.mwicks.spring.variation.controller.snpinsertiondeletion;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;

import java.util.Iterator;
import java.util.List;

import java.io.File;
import java.io.InputStream;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import com.roslin.mwicks.spring.variation.dto.web.objects.snpinsertiondeletion.DTODownloadSNPInsertionDeletion;
import com.roslin.mwicks.spring.variation.dto.web.objects.snpinsertiondeletion.DTOSearchSNPInsertionDeletion;

import com.roslin.mwicks.spring.variation.exception.ensemblgene.ExceptionEnsemblGeneDownStreamNotNumeric;
import com.roslin.mwicks.spring.variation.exception.ensemblgene.ExceptionEnsemblGeneDownStreamSearchRangeGreaterThanTenThousand;
import com.roslin.mwicks.spring.variation.exception.ensemblgene.ExceptionEnsemblGeneMultiplesFound;
import com.roslin.mwicks.spring.variation.exception.ensemblgene.ExceptionEnsemblGeneNotFound;
import com.roslin.mwicks.spring.variation.exception.ensemblgene.ExceptionEnsemblGeneSearchRangeLessThanZero;
import com.roslin.mwicks.spring.variation.exception.ensemblgene.ExceptionEnsemblGeneUpStreamNotNumeric;
import com.roslin.mwicks.spring.variation.exception.ensemblgene.ExceptionEnsemblGeneUpStreamSearchRangeGreaterThanTenThousand;

import com.roslin.mwicks.spring.variation.exception.snpinsertiondeletion.ExceptionSNPInsertionDeletionAlternativeAlleleNotSupplied;
import com.roslin.mwicks.spring.variation.exception.snpinsertiondeletion.ExceptionSNPInsertionDeletionHighCoordinateNotNumeric;
import com.roslin.mwicks.spring.variation.exception.snpinsertiondeletion.ExceptionSNPInsertionDeletionHighCoordinateNotSupplied;
import com.roslin.mwicks.spring.variation.exception.snpinsertiondeletion.ExceptionSNPInsertionDeletionLowCoordinateGreaterThanHighCoordinate;
import com.roslin.mwicks.spring.variation.exception.snpinsertiondeletion.ExceptionSNPInsertionDeletionLowCoordinateNotNumeric;
import com.roslin.mwicks.spring.variation.exception.snpinsertiondeletion.ExceptionSNPInsertionDeletionLowCoordinateNotSupplied;
import com.roslin.mwicks.spring.variation.exception.snpinsertiondeletion.ExceptionSNPInsertionDeletionNotSelected;
import com.roslin.mwicks.spring.variation.exception.snpinsertiondeletion.ExceptionSNPInsertionDeletionReferenceAlleleEqualsAlternativeAllele;
import com.roslin.mwicks.spring.variation.exception.snpinsertiondeletion.ExceptionSNPInsertionDeletionReferenceAlleleNotSupplied;
import com.roslin.mwicks.spring.variation.exception.snpinsertiondeletion.ExceptionSNPInsertionDeletionSearchFilterProteinAlignNumberValueNotNumeric;
import com.roslin.mwicks.spring.variation.exception.snpinsertiondeletion.ExceptionSNPInsertionDeletionSearchFilterProveanScoreValueNotNumeric;
import com.roslin.mwicks.spring.variation.exception.snpinsertiondeletion.ExceptionSNPInsertionDeletionSearchFilterSiftConservationScoreValueNotNumeric;
import com.roslin.mwicks.spring.variation.exception.snpinsertiondeletion.ExceptionSNPInsertionDeletionSearchFilterSiftScoreValueNotNumeric;
import com.roslin.mwicks.spring.variation.exception.snpinsertiondeletion.ExceptionSNPInsertionDeletionSearchFilterTotalNumberSeqAlignedValueNotNumeric;
import com.roslin.mwicks.spring.variation.exception.snpinsertiondeletion.ExceptionSNPInsertionDeletionSearchRangeGreaterThanOneMillion;
import com.roslin.mwicks.spring.variation.exception.snpinsertiondeletion.ExceptionSNPInsertionDeletionSelectedWithGeneName;


import com.roslin.mwicks.spring.variation.model.other.CSVResponseSNPInsertionDeletion;
import com.roslin.mwicks.spring.variation.model.other.PageSNPInsertionDeletion;

import com.roslin.mwicks.spring.variation.model.snpinsertiondeletion.SNPInsertionDeletion;
import com.roslin.mwicks.spring.variation.routines.ConvertFiletoDTOSearchSNPInsertionDeletionList;
import com.roslin.mwicks.spring.variation.serviceinterface.ensemblgene.ServiceEnsemblGene;

import com.roslin.mwicks.spring.variation.serviceinterface.snpinsertiondeletion.ServiceSNPInsertionDeletion;
import com.roslin.mwicks.utility.FileUtil;


/**
 * @author Mike Wicks
 */
@Controller
@SessionAttributes("SNPInsertionDeletion")
//public class ControllerSNPInsertionDeletion {
public class ControllerSNPInsertionDeletion extends AbstractController {
    
    private static final Logger LOGGER = LoggerFactory.getLogger(ControllerSNPInsertionDeletion.class);
    
    protected static final String FEEDBACK_MESSAGE_KEY_UPLOAD_RESULTS_SUCCESS = "feedback.message.upload.results.success";
    
    protected static final String ERROR_MESSAGE_KEY_UPLOAD_RESULTS_EMPTY = "error.message.upload.results.empty";

    protected static final String FEEDBACK_MESSAGE_KEY_SEARCH_RESULTS_SINGLE = "feedback.message.search.results.single";
    protected static final String FEEDBACK_MESSAGE_KEY_SEARCH_RESULTS_MULTIPLE = "feedback.message.search.results.multiple";

    protected static final String ERROR_MESSAGE_SEARCH_GENE_NAME_MULTIPLE = "error.message.search.gene.multiple";
    protected static final String ERROR_MESSAGE_SEARCH_GENE_NAME_UNKNOWN = "error.message.search.gene.unknown";
    
    protected static final String ERROR_MESSAGE_SEARCH_NOT_NUMERIC_UP_STREAM = "error.message.search.notnumeric.upstream";
    protected static final String ERROR_MESSAGE_SEARCH_NOT_NUMERIC_DOWN_STREAM = "error.message.search.notnumeric.downstream";

    protected static final String ERROR_MESSAGE_SEARCH_RANGE_NEGATIVE = "error.message.search.range.negative";
    protected static final String ERROR_MESSAGE_SEARCH_UPSTREAM_TEN_THOUSAND_BASE_PAIRS = "error.message.search.upstream.outsiderange.tenthousand";
    protected static final String ERROR_MESSAGE_SEARCH_DOWNSTREAM_TEN_THOUSAND_BASE_PAIRS = "error.message.search.downstream.outsiderange.tenthousand";
    protected static final String ERROR_MESSAGE_SEARCH_ONE_MILLION_BASE_PAIRS = "error.message.search.outsiderange.onemillion";
    
    protected static final String ERROR_MESSAGE_SEARCH_OUTSIDE_RANGE_LOW_POSITION_GE_HIGH_POSITION = "error.message.search.outsiderange.lowPositionGEHighPosition";
    
    protected static final String ERROR_MESSAGE_SEARCH_NOT_NUMERIC_LOW_POSITION = "error.message.search.notnumeric.lowPosition";
    protected static final String ERROR_MESSAGE_SEARCH_NOT_NUMERIC_HIGH_POSITION = "error.message.search.notnumeric.highPosition";
    
    protected static final String ERROR_MESSAGE_SEARCH_NOT_SUPPLIED_LOW_POSITION = "error.message.search.notsupplied.lowPosition";
    protected static final String ERROR_MESSAGE_SEARCH_NOT_SUPPLIED_HIGH_POSITION = "error.message.search.notsupplied.highPosition";

    protected static final String ERROR_MESSAGE_SEARCH_NOTCHOSEN_CHROMOSOME_NOT_SELECTED = "error.message.search.notchosen.chromosome";
    protected static final String ERROR_MESSAGE_SEARCH_NOTCHOSEN_REFERENCE_NOT_SELECTED = "error.message.search.notchosen.referenceStrain";
    protected static final String ERROR_MESSAGE_SEARCH_NOTCHOSEN_ALTERNATIVE_NOT_SELECTED = "error.message.search.notchosen.alternativeStrain";
    protected static final String ERROR_MESSAGE_SEARCH_EQUALS_REFERENCE_EQUALS_ALTERNATIVE = "error.message.search.equals.referenceStrainEQalternativeStrain";
    protected static final String ERROR_MESSAGE_SEARCH_CHOSEN_CHROMOSOME_AND_GENENAME = "error.message.search.notchosen.chromosomeANDgenename";
    
    protected static final String ERROR_MESSAGE_SEARCH_FILTER_NOT_NUMERIC_SIFT_SCORE = "error.message.search.filter.notnumeric.searchFilterSiftScore";
    protected static final String ERROR_MESSAGE_SEARCH_FILTER_NOT_NUMERIC_SIFT_CONSERVATION_SCORE = "error.message.search.filter.notnumeric.searchFilterSiftConservationScore";
    protected static final String ERROR_MESSAGE_SEARCH_FILTER_NOT_NUMERIC_PROTEIN_ALIGN_NUMBER = "error.message.search.filter.notnumeric.searchFilterProteinAlignNumber";
    protected static final String ERROR_MESSAGE_SEARCH_FILTER_NOT_NUMERIC_TOTAL_NUMBER_SEQ_ALIGNED = "error.message.search.filter.notnumeric.searchFilterTotalNumberSeqAligned";
    protected static final String ERROR_MESSAGE_SEARCH_FILTER_NOT_NUMERIC_PROVEAN_SCORE = "error.message.search.filter.notnumeric.searchFilterProveanScore";

    protected static final String ERROR_MESSAGE_SEARCH_GENE_NAME_MULTIPLE_FILE = "error.message.search.gene.multiple.file";
    protected static final String ERROR_MESSAGE_SEARCH_GENE_NAME_UNKNOWN_FILE = "error.message.search.gene.unknown.file";
    
    protected static final String ERROR_MESSAGE_SEARCH_NOT_NUMERIC_UP_STREAM_FILE = "error.message.search.notnumeric.upstream.file";
    protected static final String ERROR_MESSAGE_SEARCH_NOT_NUMERIC_DOWN_STREAM_FILE = "error.message.search.notnumeric.downstream.file";

    protected static final String ERROR_MESSAGE_SEARCH_RANGE_NEGATIVE_FILE = "error.message.search.range.negative.file";
    protected static final String ERROR_MESSAGE_SEARCH_UPSTREAM_TEN_THOUSAND_BASE_PAIRS_FILE = "error.message.search.upstream.outsiderange.tenthousand.file";
    protected static final String ERROR_MESSAGE_SEARCH_DOWNSTREAM_TEN_THOUSAND_BASE_PAIRS_FILE = "error.message.search.downstream.outsiderange.tenthousand.file";
    protected static final String ERROR_MESSAGE_SEARCH_ONE_MILLION_BASE_PAIRS_FILE = "error.message.search.outsiderange.onemillion.file";
    
    protected static final String ERROR_MESSAGE_SEARCH_OUTSIDE_RANGE_LOW_POSITION_GE_HIGH_POSITION_FILE = "error.message.search.outsiderange.lowPositionGEHighPosition.file";
    
    protected static final String ERROR_MESSAGE_SEARCH_NOT_NUMERIC_LOW_POSITION_FILE = "error.message.search.notnumeric.lowPosition.file";
    protected static final String ERROR_MESSAGE_SEARCH_NOT_NUMERIC_HIGH_POSITION_FILE = "error.message.search.notnumeric.highPosition.file";
    
    protected static final String ERROR_MESSAGE_SEARCH_NOT_SUPPLIED_LOW_POSITION_FILE = "error.message.search.notsupplied.lowPosition.file";
    protected static final String ERROR_MESSAGE_SEARCH_NOT_SUPPLIED_HIGH_POSITION_FILE = "error.message.search.notsupplied.highPosition.file";

    protected static final String ERROR_MESSAGE_SEARCH_NOTCHOSEN_CHROMOSOME_NOT_SELECTED_FILE = "error.message.search.notchosen.chromosome.file";
    protected static final String ERROR_MESSAGE_SEARCH_NOTCHOSEN_REFERENCE_NOT_SELECTED_FILE = "error.message.search.notchosen.referenceStrain.file";
    protected static final String ERROR_MESSAGE_SEARCH_NOTCHOSEN_ALTERNATIVE_NOT_SELECTED_FILE = "error.message.search.notchosen.alternativeStrain.file";
    protected static final String ERROR_MESSAGE_SEARCH_EQUALS_REFERENCE_EQUALS_ALTERNATIVE_FILE = "error.message.search.equals.referenceStrainEQalternativeStrain.file";
    protected static final String ERROR_MESSAGE_SEARCH_CHOSEN_CHROMOSOME_AND_GENENAME_FILE = "error.message.search.notchosen.chromosomeANDgenename.file";

    protected static final String ERROR_MESSAGE_SEARCH_FILTER_NOT_NUMERIC_SIFT_SCORE_FILE = "error.message.search.filter.notnumeric.searchFilterSiftScore.file";
    protected static final String ERROR_MESSAGE_SEARCH_FILTER_NOT_NUMERIC_SIFT_CONSERVATION_SCORE_FILE = "error.message.search.filter.notnumeric.searchFilterSiftConservationScore.file";
    protected static final String ERROR_MESSAGE_SEARCH_FILTER_NOT_NUMERIC_PROTEIN_ALIGN_NUMBER_FILE = "error.message.search.filter.notnumeric.searchFilterProteinAlignNumber.file";
    protected static final String ERROR_MESSAGE_SEARCH_FILTER_NOT_NUMERIC_TOTAL_NUMBER_SEQ_ALIGNED_FILE = "error.message.search.filter.notnumeric.searchFilterTotalNumberSeqAligned.file";
    protected static final String ERROR_MESSAGE_SEARCH_FILTER_NOT_NUMERIC_PROVEAN_SCORE_FILE = "error.message.search.filter.notnumeric.searchFilterProveanScore.file";

    protected static final String MODEL_ATTIRUTE_SNPCHROMOSOME = "SNPInsertionDeletion";
    protected static final String MODEL_ATTRIBUTE_SNPCHROMOSOMES = "SNPInsertionDeletions";
    
    protected static final String MODEL_ATTRIBUTE_SEARCHCRITERIA = "dtoSearch";
    protected static final String MODEL_ATTRIBUTE_DOWNLOADCRITERIA = "dtoDownload";

    protected static final String SNPINSERTIONDELETION_UPLOAD_VIEW = "SNPInsertionDeletion/page_upload";
    protected static final String SNPINSERTIONDELETION_SEARCH_VIEW = "SNPInsertionDeletion/page_search";
    protected static final String SNPINSERTIONDELETION_SEARCH_VIEW_HELP = "SNPInsertionDeletion/page_search_help";
    protected static final String SNPINSERTIONDELETION_SEARCH_RESULT_VIEW = "SNPInsertionDeletion/page_search_results";
    protected static final String SNPINSERTIONDELETION_SEARCH_RESULT_VIEW_HELP = "SNPInsertionDeletion/page_search_results_help";
    
    protected static final String REQUEST_MAPPING_LIST = "/";
    
    protected static final String REQUEST_ROOT_MAPPING = "/";

    protected static final String REQUEST_UPLOAD_MAPPING = "/upload";
    protected static final String REQUEST_DOWNLOAD_MAPPING = "/download";

    protected static final String REQUEST_SEARCH_MAPPING = "/search";
    protected static final String REQUEST_SEARCH_RESULT_MAPPING = "/results";

    protected static final String REQUEST_SEARCH_HELP_MAPPING = "/search_help";
    protected static final String REQUEST_SEARCH_RESULT_HELP_MAPPING = "/search_results_help";

    protected static final String REQUEST_PARAM_SEARCH_UPLOAD_FILE = "searchUploadFile";

    protected static final String REQUEST_PARAM_CHROMOSOME = "chr";
    protected static final String REQUEST_PARAM_LOW_RANGE = "low";
    protected static final String REQUEST_PARAM_HIGH_RANGE = "high";
    protected static final String REQUEST_PARAM_REFERENCE_STRAIN = "ref";
    protected static final String REQUEST_PARAM_ALTERNATIVE_STRAIN = "alt";

    protected static final String NONE = "NONE";
    
    private static String UPLOADED_FOLDER = "/tmp/";

    private static final String MSGLEVEL = "*";

    protected static final int ONE_HUNDRED_MILLION = 100000000;
    protected static final int TEN_THOUSAND = 10000;

    
    @Resource
    private MessageSource messageSource;

    @Resource
    private ServiceSNPInsertionDeletion servicesnpinsertiondeletion;
    
    @Resource
    private ServiceEnsemblGene serviceensemblgene;


    // --------------------------------------------------------------------------------------------
    // HTTP GET Requests --------------------------------------------------------------------------
    // --------------------------------------------------------------------------------------------
    
    /**
     * Processes requests for the Search Help page.
     * @param model
     * @return The name of the Search Help view.
     * @method GET
     */
    @RequestMapping(value = REQUEST_SEARCH_HELP_MAPPING, method = RequestMethod.GET)
    public String showSearchHelp(
    	Model model
    	) {
    	
        LOGGER.debug("Rendering SNPInsertionDeletion Search Help page");

        return SNPINSERTIONDELETION_SEARCH_VIEW_HELP;
    }

    
    /**
     * Processes requests for the Search Results Help page.
     * @param model
     * @return The name of the Search Results Help view.
     * @method GET
     */
    @RequestMapping(value = REQUEST_SEARCH_RESULT_HELP_MAPPING, method = RequestMethod.GET)
    public String showSearchResultsHelp(
    	Model model
    	) {
    	
        LOGGER.debug("Rendering SNPInsertionDeletion Search Help page");

        return SNPINSERTIONDELETION_SEARCH_RESULT_VIEW_HELP;
    }

    
    /**
     * Processes requests to home (Search) page .
     * @param model
     * @return The name of the SNPInsertionDeletion Search (form) view.
     * @method GET
     */
    @RequestMapping(value = { REQUEST_ROOT_MAPPING, REQUEST_SEARCH_MAPPING }, method = RequestMethod.GET)
    public String searchGet(
        @ModelAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA) DTOSearchSNPInsertionDeletion dtoSearch, 
    	Model model
    	) {
    	
        LOGGER.debug("Rendering SNPInsertionDeletion Search page");

        model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, dtoSearch);
        
        return SNPINSERTIONDELETION_SEARCH_VIEW;
    }

    
    /**
     * Processes requests for the Upload page.
     * @param model
     * @return The name of the Upload view.
     * @method GET
     */
    @RequestMapping(value = REQUEST_UPLOAD_MAPPING, method = RequestMethod.GET)
    public String uploadGet( 
    		@ModelAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA) DTOSearchSNPInsertionDeletion dtoSearch, 
        	Model model
    		) {

        LOGGER.debug("Rendering SNPInsertionDeletion Upload page");

        return SNPINSERTIONDELETION_UPLOAD_VIEW;
    }

    
    /**
     * Processes requests to home page which lists all available SNPInsertionDeletion.
     * @param model
     * @param chr, Chromosome 
     * @param low, Low Search Coordinate
     * @param high, High Search Coordinate
     * @param ref, Reference Allele
     * @param alt, Alternative Allele
     * @return The name of the SNPInsertionDeletion list view.
     * @method GET
     */
	@RequestMapping(value = REQUEST_SEARCH_RESULT_MAPPING, method = RequestMethod.GET)
	public String getSearchedSNPInsertionDeletionPage( 
			@RequestParam(value = REQUEST_PARAM_CHROMOSOME, required = true) String chr, 
			@RequestParam(value = REQUEST_PARAM_LOW_RANGE, required = true) String low,
	    	@RequestParam(value = REQUEST_PARAM_HIGH_RANGE, required = true) String high,
	    	@RequestParam(value = REQUEST_PARAM_REFERENCE_STRAIN, required = true) String ref,
	    	@RequestParam(value = REQUEST_PARAM_ALTERNATIVE_STRAIN, required = true) String alt,
	    	@ModelAttribute(MODEL_ATTRIBUTE_DOWNLOADCRITERIA) DTODownloadSNPInsertionDeletion dtoDownload,
	    	Model model, 
	    	RedirectAttributes attributes ) {

		DTOSearchSNPInsertionDeletion dtoSearch = new DTOSearchSNPInsertionDeletion(1, low, high, ref, alt, chr); 

    	String successMsg = "";
    	
        PageSNPInsertionDeletion pagesnpinsertiondeletion = null;

    	try {
    		
			successMsg = dtoSearch.isDTOSearchSNPInsertionDeletionValid(serviceensemblgene);
		} 
        catch (ExceptionSNPInsertionDeletionSelectedWithGeneName e) {
        	
        	LOGGER.debug("ERROR: Search Chromosome Supplied AND Ensembl Gene Name Supplied !!!");
            addErrorMessage(model, ERROR_MESSAGE_SEARCH_CHOSEN_CHROMOSOME_AND_GENENAME);
            model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, dtoSearch);
            
            return SNPINSERTIONDELETION_SEARCH_RESULT_VIEW;
        }
        catch (ExceptionSNPInsertionDeletionNotSelected e) {
        	
        	LOGGER.debug("ERROR: The Search Chromosome has NOT been chosen !!!");
            addErrorMessage(model, ERROR_MESSAGE_SEARCH_NOTCHOSEN_CHROMOSOME_NOT_SELECTED);
            model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, dtoSearch);
            
            return SNPINSERTIONDELETION_SEARCH_RESULT_VIEW;
        }
        catch (ExceptionSNPInsertionDeletionSearchFilterProteinAlignNumberValueNotNumeric e) {
        	
        	LOGGER.debug("ERROR: The Search Filter Protein Alignment Number is NOT Numeric !!!");
            addErrorMessage(model, ERROR_MESSAGE_SEARCH_FILTER_NOT_NUMERIC_PROTEIN_ALIGN_NUMBER);
            model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, dtoSearch);
            
            return SNPINSERTIONDELETION_SEARCH_RESULT_VIEW;
        }
        catch (ExceptionSNPInsertionDeletionSearchFilterProveanScoreValueNotNumeric e) {
        	
        	LOGGER.debug("ERROR: The Search Filter PROVEAN Score is NOT Numeric !!!");
            addErrorMessage(model, ERROR_MESSAGE_SEARCH_FILTER_NOT_NUMERIC_PROVEAN_SCORE);
            model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, dtoSearch);
            
            return SNPINSERTIONDELETION_SEARCH_RESULT_VIEW;
        }
        catch (ExceptionSNPInsertionDeletionSearchFilterSiftConservationScoreValueNotNumeric e) {
        	
        	LOGGER.debug("ERROR: The Search Filter SIFT Conservation Score is NOT Numeric !!!");
            addErrorMessage(model, ERROR_MESSAGE_SEARCH_FILTER_NOT_NUMERIC_SIFT_CONSERVATION_SCORE);
            model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, dtoSearch);
            
            return SNPINSERTIONDELETION_SEARCH_RESULT_VIEW;
        }
        catch (ExceptionSNPInsertionDeletionSearchFilterSiftScoreValueNotNumeric e) {
        	
        	LOGGER.debug("ERROR: The Search Filter SIFT Score is NOT Numeric !!!");
            addErrorMessage(model, ERROR_MESSAGE_SEARCH_FILTER_NOT_NUMERIC_SIFT_SCORE);
            model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, dtoSearch);
            
            return SNPINSERTIONDELETION_SEARCH_RESULT_VIEW;
        }
        catch (ExceptionSNPInsertionDeletionSearchFilterTotalNumberSeqAlignedValueNotNumeric e) {
        	
        	LOGGER.debug("ERROR: The Search Filter Total Number of Sequence Aligned is NOT Numeric !!!");
            addErrorMessage(model, ERROR_MESSAGE_SEARCH_FILTER_NOT_NUMERIC_TOTAL_NUMBER_SEQ_ALIGNED);
            model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, dtoSearch);
            
            return SNPINSERTIONDELETION_SEARCH_RESULT_VIEW;
        }
        catch (ExceptionEnsemblGeneSearchRangeLessThanZero e) {
        	
        	LOGGER.debug("ERROR: Search Range is LESS THAN Zero !!!");
            addErrorMessage(model, ERROR_MESSAGE_SEARCH_RANGE_NEGATIVE);
            model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, dtoSearch);
            
            return SNPINSERTIONDELETION_SEARCH_RESULT_VIEW;
        }
        catch (ExceptionEnsemblGeneUpStreamSearchRangeGreaterThanTenThousand e) {
        	
        	LOGGER.debug("ERROR: Up Stream Search Range is GREATER THAN Ten Thousand Base Pairs !!!");
            addErrorMessage(model, ERROR_MESSAGE_SEARCH_UPSTREAM_TEN_THOUSAND_BASE_PAIRS);
            model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, dtoSearch);
            
            return SNPINSERTIONDELETION_SEARCH_RESULT_VIEW;
        }
        catch (ExceptionEnsemblGeneDownStreamSearchRangeGreaterThanTenThousand e) {
        	
        	LOGGER.debug("ERROR: Down Stream Search Range is GREATER THAN Ten Thousand Base Pairs !!!");
            addErrorMessage(model, ERROR_MESSAGE_SEARCH_DOWNSTREAM_TEN_THOUSAND_BASE_PAIRS);
            model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, dtoSearch);
            
            return SNPINSERTIONDELETION_SEARCH_RESULT_VIEW;
        }
        catch (ExceptionEnsemblGeneUpStreamNotNumeric e) {
        	
        	LOGGER.debug("ERROR: Search Upstream Range is NOT Numeric !!!");
            addErrorMessage(model, ERROR_MESSAGE_SEARCH_NOT_NUMERIC_UP_STREAM);
            model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, dtoSearch);
            
            return SNPINSERTIONDELETION_SEARCH_RESULT_VIEW;
        }
        catch (ExceptionEnsemblGeneDownStreamNotNumeric e) {
        	
        	LOGGER.debug("ERROR: Search Downstream Range is NOT Numeric !!!");
            addErrorMessage(model, ERROR_MESSAGE_SEARCH_NOT_NUMERIC_DOWN_STREAM);
            model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, dtoSearch);
            
            return SNPINSERTIONDELETION_SEARCH_RESULT_VIEW;
        }
        catch (ExceptionEnsemblGeneMultiplesFound e) {
        	
        	LOGGER.debug("ERROR: Multiple Genes Found !!!");
            addErrorMessage(model, ERROR_MESSAGE_SEARCH_GENE_NAME_MULTIPLE);
            model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, dtoSearch);
            
            return SNPINSERTIONDELETION_SEARCH_RESULT_VIEW;
        }
        catch (ExceptionEnsemblGeneNotFound e) {
        	
        	LOGGER.debug("ERROR: Requested Gene does NOT Exist !!!");
            addErrorMessage(model, ERROR_MESSAGE_SEARCH_GENE_NAME_UNKNOWN);
            model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, dtoSearch);
            
            return SNPINSERTIONDELETION_SEARCH_RESULT_VIEW;
        }
        catch (ExceptionSNPInsertionDeletionSearchRangeGreaterThanOneMillion e) {
        	
        	LOGGER.debug("ERROR: Search Range is GREATER THAN One Million Base Pairs !!!");
            addErrorMessage(model, ERROR_MESSAGE_SEARCH_ONE_MILLION_BASE_PAIRS);
            model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, dtoSearch);
            
            return SNPINSERTIONDELETION_SEARCH_RESULT_VIEW;
        }
        catch (ExceptionSNPInsertionDeletionLowCoordinateNotNumeric e) {
        	
        	LOGGER.debug("ERROR: Search Low Co-ordinate is NOT Numeric !!!");
            addErrorMessage(model, ERROR_MESSAGE_SEARCH_NOT_NUMERIC_LOW_POSITION);
            model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, dtoSearch);
            
            return SNPINSERTIONDELETION_SEARCH_RESULT_VIEW;
        }
        catch (ExceptionSNPInsertionDeletionHighCoordinateNotNumeric e) {
        	
        	LOGGER.debug("ERROR: Search High Co-ordinate is NOT Numeric !!!");
        	addErrorMessage(model, ERROR_MESSAGE_SEARCH_NOT_NUMERIC_HIGH_POSITION);
            model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, dtoSearch);
            
            return SNPINSERTIONDELETION_SEARCH_RESULT_VIEW;
        }
        catch (ExceptionSNPInsertionDeletionLowCoordinateGreaterThanHighCoordinate e) {
        	
        	LOGGER.debug("ERROR: Search Low Co-ordinate is GREATER THAN Search High Co-ordinate !!!");
        	addErrorMessage(model, ERROR_MESSAGE_SEARCH_OUTSIDE_RANGE_LOW_POSITION_GE_HIGH_POSITION);
            model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, dtoSearch);
            
            return SNPINSERTIONDELETION_SEARCH_RESULT_VIEW;
        }
        catch (ExceptionSNPInsertionDeletionReferenceAlleleNotSupplied e) {
        	
        	LOGGER.debug("ERROR: Reference Allele Not Supplied !!!");
        	addErrorMessage(model, ERROR_MESSAGE_SEARCH_NOTCHOSEN_REFERENCE_NOT_SELECTED);
        	model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, dtoSearch);
        	
            return SNPINSERTIONDELETION_SEARCH_RESULT_VIEW;
        }
        catch (ExceptionSNPInsertionDeletionAlternativeAlleleNotSupplied e) {
        	
        	LOGGER.debug("ERROR: Alternative Allele Not Supplied !!!");
        	addErrorMessage(model, ERROR_MESSAGE_SEARCH_NOTCHOSEN_ALTERNATIVE_NOT_SELECTED);
        	model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, dtoSearch);
        	
            return SNPINSERTIONDELETION_SEARCH_RESULT_VIEW;
        }
        catch (ExceptionSNPInsertionDeletionReferenceAlleleEqualsAlternativeAllele e) {
        	
        	LOGGER.debug("ERROR: Reference Allele EQUALS Alternative Allele !!!");
        	addErrorMessage(model, ERROR_MESSAGE_SEARCH_EQUALS_REFERENCE_EQUALS_ALTERNATIVE);
            model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, dtoSearch);
            
            return SNPINSERTIONDELETION_SEARCH_RESULT_VIEW;
        } 
    	catch (ExceptionSNPInsertionDeletionHighCoordinateNotSupplied e) {
    		
        	LOGGER.debug("ERROR: Search High Co-ordinate is NOT Supplied !!!");
        	addErrorMessage(model, ERROR_MESSAGE_SEARCH_NOT_SUPPLIED_HIGH_POSITION);
            model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, dtoSearch);
            
            return SNPINSERTIONDELETION_SEARCH_RESULT_VIEW;
		} 
    	catch (ExceptionSNPInsertionDeletionLowCoordinateNotSupplied e) {
    		
        	LOGGER.debug("ERROR: Search Low Co-ordinate is NOT Supplied !!!");
        	addErrorMessage(model, ERROR_MESSAGE_SEARCH_NOT_SUPPLIED_LOW_POSITION);
            model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, dtoSearch);
            
            return SNPINSERTIONDELETION_SEARCH_RESULT_VIEW;
    	}
    	catch (Exception e) {

    		e.printStackTrace();
    	}
    	
        pagesnpinsertiondeletion = servicesnpinsertiondeletion.search(dtoSearch, 1, dtoSearch.getSearchSortFieldAsString(), dtoSearch.getSearchSortDirectionAsString());

        if ( pagesnpinsertiondeletion.size() == 0) {
        	
            LOGGER.debug("EMPTY SNPInsertionDeletions !!! ");
            model.addAttribute("feedbackMessage", addFeedbackMessageAsString(FEEDBACK_MESSAGE_KEY_SEARCH_RESULTS_MULTIPLE, 0, successMsg));
        }
        else {
        	
            if ( pagesnpinsertiondeletion.getTotalElements() == 1 ) {
            	
                model.addAttribute("feedbackMessage", addFeedbackMessageAsString(FEEDBACK_MESSAGE_KEY_SEARCH_RESULTS_SINGLE, pagesnpinsertiondeletion.getTotalElements(), successMsg));
            }
            else {
            	
                model.addAttribute("feedbackMessage", addFeedbackMessageAsString(FEEDBACK_MESSAGE_KEY_SEARCH_RESULTS_MULTIPLE, pagesnpinsertiondeletion.getTotalElements(), successMsg));
            }
            
        	//pagesnpinsertiondeletion
            int current = pagesnpinsertiondeletion.getPageNumber();
            int begin = Math.max(1, current - 5);
            int end = Math.min(begin + 10, pagesnpinsertiondeletion.getTotalPages());
            int totalPages = pagesnpinsertiondeletion.getTotalPages();

            model.addAttribute("SNPInsertionDeletion", pagesnpinsertiondeletion);
            model.addAttribute("beginIndex", begin);
            model.addAttribute("endIndex", end);
            model.addAttribute("currentIndex", current);
            model.addAttribute("totalPages", totalPages);
            
            dtoDownload = new DTODownloadSNPInsertionDeletion(
            		"", 
            		"",
            		dtoSearch.getSearchLowRange(),
            		dtoSearch.getSearchHighRange(),
            		dtoSearch.getSearchReferenceBreed(),
            		dtoSearch.getSearchAlternativeBreed(),
            		dtoSearch.getSearchChromosome(),
            		dtoSearch.getSearchFilterSiftScoreValue(),
            		dtoSearch.getSearchFilterSiftConservationScoreValue(),
            		dtoSearch.getSearchFilterProteinAlignNumberValue(),
            		dtoSearch.getSearchFilterTotalNumberSeqAlignedValue(),
            		dtoSearch.getSearchFilterProveanScoreValue(),
            		dtoSearch.getSearchFilterSiftScore(),
            		dtoSearch.getSearchFilterSiftConservationScore(),
            		dtoSearch.getSearchFilterProteinAlignNumber(),
            		dtoSearch.getSearchFilterTotalNumberSeqAligned(),
            		dtoSearch.getSearchFilterProveanScore(),
            		dtoSearch.getSearchSortField(),
            		dtoSearch.getSearchSortDirection(),
            		dtoSearch.getSearchUploadFileName(),
            		dtoSearch.getSearchUploadFile()
            		);
            
            model.addAttribute(MODEL_ATTRIBUTE_DOWNLOADCRITERIA, dtoDownload);
        }

        return SNPINSERTIONDELETION_SEARCH_RESULT_VIEW;
    }
	
	
    // --------------------------------------------------------------------------------------------
    // HTTP POST Requests -------------------------------------------------------------------------
    // --------------------------------------------------------------------------------------------

    /**
     * Processes requests from the Upload.
     * @param model
     * @return The name of the SNPInsertionDeletion Results, list  view.
     * @method POST
     */
    @RequestMapping(value = REQUEST_UPLOAD_MAPPING, method = RequestMethod.POST)
    public String uploadPost(
    		@RequestParam(REQUEST_PARAM_SEARCH_UPLOAD_FILE) MultipartFile file,
            @ModelAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA) DTOSearchSNPInsertionDeletion dtoSearch, 
            RedirectAttributes redirectAttributes, 
            Model model
            ) {

        LOGGER.debug("Processing SNPInsertionDeletion Upload page");

        if ( file.isEmpty() ) {

            LOGGER.debug("Empty File input field !!!");
        	addErrorMessage(model, ERROR_MESSAGE_KEY_UPLOAD_RESULTS_EMPTY);

            return SNPINSERTIONDELETION_SEARCH_VIEW;
        }

        try {

            byte[] bytes = file.getBytes();
            Path path = Paths.get(UPLOADED_FOLDER + file.getOriginalFilename());
            Files.write(path, bytes);
            
            File tmpFile = path.toFile();
            InputStream csvInput = FileUtil.readStream(tmpFile);

            int totalRequestCount = 0;
    		
            List<DTOSearchSNPInsertionDeletion> dtosearchsnpinsertiondeletionList = ConvertFiletoDTOSearchSNPInsertionDeletionList.run( csvInput, totalRequestCount, MSGLEVEL, MSGLEVEL );

	        Iterator<DTOSearchSNPInsertionDeletion> iteratorDTOSearchSNPInsertionDeletion = dtosearchsnpinsertiondeletionList.iterator();

	        PageSNPInsertionDeletion pagesnpinsertiondeletionTotal = new PageSNPInsertionDeletion();
	        
	        pagesnpinsertiondeletionTotal.setPageNumber(1);
	        pagesnpinsertiondeletionTotal.setTotalElements(0);
	        pagesnpinsertiondeletionTotal.setTotalPages(1);
	        
	    	String successMsg = "";
	    	
	     	while ( iteratorDTOSearchSNPInsertionDeletion.hasNext() ) {
	    		
	    		DTOSearchSNPInsertionDeletion dtosearchsnpinsertiondeletion = iteratorDTOSearchSNPInsertionDeletion.next();
	    		
	            try {
	            	
	    			successMsg = dtosearchsnpinsertiondeletion.isDTOSearchSNPInsertionDeletionValid( serviceensemblgene );

	            }
	            catch (ExceptionSNPInsertionDeletionSelectedWithGeneName e) {
	            	
	            	LOGGER.debug("ERROR: Search Chromosome Supplied AND Ensembl Gene Name Supplied !!!");
	                addErrorMessage(model, ERROR_MESSAGE_SEARCH_CHOSEN_CHROMOSOME_AND_GENENAME_FILE);
	                model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, dtoSearch);
	                
	                return SNPINSERTIONDELETION_SEARCH_VIEW;
	            }
	            catch (ExceptionSNPInsertionDeletionNotSelected e) {
	            	
	            	LOGGER.debug("ERROR: The Search Chromosome has NOT been chosen !!!");
	                addErrorMessage(model, ERROR_MESSAGE_SEARCH_NOTCHOSEN_CHROMOSOME_NOT_SELECTED_FILE);
	                model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, dtoSearch);
	                
	                return SNPINSERTIONDELETION_SEARCH_VIEW;
	            }
	            catch (ExceptionSNPInsertionDeletionSearchFilterProteinAlignNumberValueNotNumeric e) {
	            	
	            	LOGGER.debug("ERROR: The Search Filter Protein Alignment Number is NOT Numeric !!!");
	                addErrorMessage(model, ERROR_MESSAGE_SEARCH_FILTER_NOT_NUMERIC_PROTEIN_ALIGN_NUMBER_FILE);
	                model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, dtoSearch);
	                
	                return SNPINSERTIONDELETION_SEARCH_VIEW;
	            }
	            catch (ExceptionSNPInsertionDeletionSearchFilterProveanScoreValueNotNumeric e) {
	            	
	            	LOGGER.debug("ERROR: The Search Filter PROVEAN Score is NOT Numeric !!!");
	                addErrorMessage(model, ERROR_MESSAGE_SEARCH_FILTER_NOT_NUMERIC_PROVEAN_SCORE_FILE);
	                model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, dtoSearch);
	                
	                return SNPINSERTIONDELETION_SEARCH_VIEW;
	            }
	            catch (ExceptionSNPInsertionDeletionSearchFilterSiftConservationScoreValueNotNumeric e) {
	            	
	            	LOGGER.debug("ERROR: The Search Filter SIFT Conservation Score is NOT Numeric !!!");
	                addErrorMessage(model, ERROR_MESSAGE_SEARCH_FILTER_NOT_NUMERIC_SIFT_CONSERVATION_SCORE_FILE);
	                model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, dtoSearch);
	                
	                return SNPINSERTIONDELETION_SEARCH_VIEW;
	            }
	            catch (ExceptionSNPInsertionDeletionSearchFilterSiftScoreValueNotNumeric e) {
	            	
	            	LOGGER.debug("ERROR: The Search Filter SIFT Score is NOT Numeric !!!");
	                addErrorMessage(model, ERROR_MESSAGE_SEARCH_FILTER_NOT_NUMERIC_SIFT_SCORE_FILE);
	                model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, dtoSearch);
	                
	                return SNPINSERTIONDELETION_SEARCH_VIEW;
	            }
	            catch (ExceptionSNPInsertionDeletionSearchFilterTotalNumberSeqAlignedValueNotNumeric e) {
	            	
	            	LOGGER.debug("ERROR: The Search Filter Total Number of Sequence Aligned is NOT Numeric !!!");
	                addErrorMessage(model, ERROR_MESSAGE_SEARCH_FILTER_NOT_NUMERIC_TOTAL_NUMBER_SEQ_ALIGNED_FILE);
	                model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, dtoSearch);
	                
	                return SNPINSERTIONDELETION_SEARCH_VIEW;
	            }
	            catch (ExceptionEnsemblGeneSearchRangeLessThanZero e) {
	            	
	            	LOGGER.debug("ERROR: Search Range is LESS THAN Zero !!!");
	                addErrorMessage(model, ERROR_MESSAGE_SEARCH_RANGE_NEGATIVE_FILE);
	                model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, dtoSearch);
	                
	                return SNPINSERTIONDELETION_SEARCH_VIEW;
	            }
	            catch (ExceptionEnsemblGeneUpStreamSearchRangeGreaterThanTenThousand e) {
	            	
	            	LOGGER.debug("ERROR: Up Stream Search Range is GREATER THAN Ten Thousand Base Pairs !!!");
	                addErrorMessage(model, ERROR_MESSAGE_SEARCH_UPSTREAM_TEN_THOUSAND_BASE_PAIRS_FILE);
	                model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, dtoSearch);
	                
	                return SNPINSERTIONDELETION_SEARCH_VIEW;
	            }
	            catch (ExceptionEnsemblGeneDownStreamSearchRangeGreaterThanTenThousand e) {
	            	
	            	LOGGER.debug("ERROR: Down Stream Search Range is GREATER THAN Ten Thousand Base Pairs !!!");
	                addErrorMessage(model, ERROR_MESSAGE_SEARCH_DOWNSTREAM_TEN_THOUSAND_BASE_PAIRS_FILE);
	                model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, dtoSearch);
	                
	                return SNPINSERTIONDELETION_SEARCH_VIEW;
	            }
	            catch (ExceptionEnsemblGeneUpStreamNotNumeric e) {
	            	
	            	LOGGER.debug("ERROR: Search Upstream Range is NOT Numeric !!!");
	                addErrorMessage(model, ERROR_MESSAGE_SEARCH_NOT_NUMERIC_UP_STREAM_FILE);
	                model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, dtoSearch);
	                
	                return SNPINSERTIONDELETION_SEARCH_VIEW;
	            }
	            catch (ExceptionEnsemblGeneDownStreamNotNumeric e) {
	            	
	            	LOGGER.debug("ERROR: Search Downstream Range is NOT Numeric !!!");
	                addErrorMessage(model, ERROR_MESSAGE_SEARCH_NOT_NUMERIC_DOWN_STREAM_FILE);
	                model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, dtoSearch);
	                
	                return SNPINSERTIONDELETION_SEARCH_VIEW;
	            }
	            catch (ExceptionEnsemblGeneMultiplesFound e) {
	            	
	            	LOGGER.debug("ERROR: Multiple Genes Found !!!");
	                addErrorMessage(model, ERROR_MESSAGE_SEARCH_GENE_NAME_MULTIPLE_FILE);
	                model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, dtoSearch);
	                
	                return SNPINSERTIONDELETION_SEARCH_VIEW;
	            }
	            catch (ExceptionEnsemblGeneNotFound e) {
	            	
	            	LOGGER.debug("ERROR: Requested Gene does NOT Exist !!!");
	                addErrorMessage(model, ERROR_MESSAGE_SEARCH_GENE_NAME_UNKNOWN_FILE);
	                model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, dtoSearch);
	                
	                return SNPINSERTIONDELETION_SEARCH_VIEW;
	            }
	            catch (ExceptionSNPInsertionDeletionSearchRangeGreaterThanOneMillion e) {
	            	
	            	LOGGER.debug("ERROR: Search Range is GREATER THAN One Million Base Pairs !!!");
	                addErrorMessage(model, ERROR_MESSAGE_SEARCH_ONE_MILLION_BASE_PAIRS_FILE);
	                model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, dtoSearch);
	                
	                return SNPINSERTIONDELETION_SEARCH_VIEW;
	            }
	            catch (ExceptionSNPInsertionDeletionLowCoordinateNotNumeric e) {
	            	
	            	LOGGER.debug("ERROR: Search Low Co-ordinate is NOT Numeric !!!");
	                addErrorMessage(model, ERROR_MESSAGE_SEARCH_NOT_NUMERIC_LOW_POSITION_FILE);
	                model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, dtoSearch);
	                
	                return SNPINSERTIONDELETION_SEARCH_VIEW;
	            }
	            catch (ExceptionSNPInsertionDeletionHighCoordinateNotNumeric e) {
	            	
	            	LOGGER.debug("ERROR: Search High Co-ordinate is NOT Numeric !!!");
	            	addErrorMessage(model, ERROR_MESSAGE_SEARCH_NOT_NUMERIC_HIGH_POSITION_FILE);
	                model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, dtoSearch);
	                
	                return SNPINSERTIONDELETION_SEARCH_VIEW;
	            }
	            catch (ExceptionSNPInsertionDeletionLowCoordinateGreaterThanHighCoordinate e) {
	            	
	            	LOGGER.debug("ERROR: Search Low Co-ordinate is GREATER THAN Search High Co-ordinate !!!");
	            	addErrorMessage(model, ERROR_MESSAGE_SEARCH_OUTSIDE_RANGE_LOW_POSITION_GE_HIGH_POSITION_FILE);
	                model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, dtoSearch);
	                
	                return SNPINSERTIONDELETION_SEARCH_VIEW;
	            }
	            catch (ExceptionSNPInsertionDeletionReferenceAlleleNotSupplied e) {
	            	
	            	LOGGER.debug("ERROR: Reference Allele Not Supplied !!!");
	            	addErrorMessage(model, ERROR_MESSAGE_SEARCH_NOTCHOSEN_REFERENCE_NOT_SELECTED_FILE);
	            	model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, dtoSearch);
	            	
	                return SNPINSERTIONDELETION_SEARCH_VIEW;
	            }
	            catch (ExceptionSNPInsertionDeletionAlternativeAlleleNotSupplied e) {
	            	
	            	LOGGER.debug("ERROR: Alternative Allele Not Supplied !!!");
	            	addErrorMessage(model, ERROR_MESSAGE_SEARCH_NOTCHOSEN_ALTERNATIVE_NOT_SELECTED_FILE);
	            	model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, dtoSearch);
	            	
	                return SNPINSERTIONDELETION_SEARCH_VIEW;
	            }
	            catch (ExceptionSNPInsertionDeletionReferenceAlleleEqualsAlternativeAllele e) {
	            	
	            	LOGGER.debug("ERROR: Reference Allele EQUALS Alternative Allele !!!");
	            	addErrorMessage(model, ERROR_MESSAGE_SEARCH_EQUALS_REFERENCE_EQUALS_ALTERNATIVE_FILE);
	                model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, dtoSearch);
	                
	                return SNPINSERTIONDELETION_SEARCH_VIEW;
	            } 
	        	catch (ExceptionSNPInsertionDeletionHighCoordinateNotSupplied e) {
	        		
	            	LOGGER.debug("ERROR: Search High Co-ordinate is NOT Supplied !!!");
	            	addErrorMessage(model, ERROR_MESSAGE_SEARCH_NOT_SUPPLIED_HIGH_POSITION_FILE);
	                model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, dtoSearch);
	                
	                return SNPINSERTIONDELETION_SEARCH_VIEW;
	        	} 
	        	catch (ExceptionSNPInsertionDeletionLowCoordinateNotSupplied e) {
	        		
	            	LOGGER.debug("ERROR: Search Low Co-ordinate is NOT Supplied !!!");
	            	addErrorMessage(model, ERROR_MESSAGE_SEARCH_NOT_SUPPLIED_LOW_POSITION_FILE);
	                model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, dtoSearch);
	                
	                return SNPINSERTIONDELETION_SEARCH_VIEW;
	        	}

        		PageSNPInsertionDeletion pagesnpinsertiondeletionRequest = servicesnpinsertiondeletion.search(dtosearchsnpinsertiondeletion, 1, dtosearchsnpinsertiondeletion.getSearchSortFieldAsString(), dtosearchsnpinsertiondeletion.getSearchSortDirectionAsString());

	            if ( pagesnpinsertiondeletionRequest.size() != 0 ) {
	            	
            		Iterator<SNPInsertionDeletion> iteratorSNPInsertionDeletion = pagesnpinsertiondeletionRequest.iterator();

        	     	while ( iteratorSNPInsertionDeletion.hasNext() ) {
        	    		
        	     		SNPInsertionDeletion snpinsertiondeletion = iteratorSNPInsertionDeletion.next();

        	    		if ( !pagesnpinsertiondeletionTotal.contains( snpinsertiondeletion )) {
        	    			
        	    			pagesnpinsertiondeletionTotal.incrementTotalElements();
        	    			
        	            	pagesnpinsertiondeletionTotal.add( snpinsertiondeletion );
        	    		}
        	     	}
	            }
	     	}

	     	successMsg = " from the File \"" + file.getOriginalFilename() + "\"";
	     	
	     	dtoSearch.setSearchUploadFileName( path.toString() );
	     	dtoSearch.setSearchUploadFile( file );

	     	if ( pagesnpinsertiondeletionTotal.size() == 0 ) {
            	
                LOGGER.debug("EMPTY SNPInsertionDeletions !!! ");
            	addFeedbackMessage( model, FEEDBACK_MESSAGE_KEY_SEARCH_RESULTS_MULTIPLE, 0, successMsg );
                model.addAttribute( MODEL_ATTRIBUTE_SEARCHCRITERIA, dtoSearch );

                return SNPINSERTIONDELETION_SEARCH_VIEW;
            }
            else {

                int current = pagesnpinsertiondeletionTotal.getPageNumber();
                int begin = Math.max(1, current - 5);
                int end = Math.min(begin + 10, pagesnpinsertiondeletionTotal.getTotalPages());
                int totalPages = pagesnpinsertiondeletionTotal.getTotalPages();

                model.addAttribute("SNPInsertionDeletion", pagesnpinsertiondeletionTotal);
                model.addAttribute("beginIndex", begin);
                model.addAttribute("endIndex", end);
                model.addAttribute("currentIndex", current);
                model.addAttribute("totalPages", totalPages);
                
            	DTODownloadSNPInsertionDeletion dtoDownload = new DTODownloadSNPInsertionDeletion( 
            			dtoSearch.getSearchDownStream(),
            	        dtoSearch.getSearchUpStream(),
            			dtoSearch.getSearchLowRange(), 
            			dtoSearch.getSearchHighRange(), 
            			dtoSearch.getSearchReferenceBreed(), 
            			dtoSearch.getSearchAlternativeBreed(), 
            	        dtoSearch.getSearchChromosome(),
            			dtoSearch.getSearchFilterSiftScoreValue(), 
            			dtoSearch.getSearchFilterSiftConservationScoreValue(), 
            			dtoSearch.getSearchFilterProteinAlignNumberValue(), 
            			dtoSearch.getSearchFilterTotalNumberSeqAlignedValue(), 
            			dtoSearch.getSearchFilterProveanScoreValue(), 
            			dtoSearch.getSearchFilterSiftScore(), 
            			dtoSearch.getSearchFilterSiftConservationScore(), 
            			dtoSearch.getSearchFilterProteinAlignNumber(), 
            			dtoSearch.getSearchFilterTotalNumberSeqAligned(), 
            			dtoSearch.getSearchFilterProveanScore(), 
            			dtoSearch.getSearchSortField(), 
            			dtoSearch.getSearchSortDirection(), 
            	        dtoSearch.getSearchUploadFileName(),
            	        dtoSearch.getSearchUploadFile()
            	);

                model.addAttribute(MODEL_ATTRIBUTE_DOWNLOADCRITERIA, dtoDownload);

                if ( pagesnpinsertiondeletionTotal.getTotalElements() == 1 ) {
                	
                    model.addAttribute( "feedbackMessage", addFeedbackMessageAsString( FEEDBACK_MESSAGE_KEY_SEARCH_RESULTS_SINGLE, pagesnpinsertiondeletionTotal.getTotalElements(), successMsg ) );
                }
                else {
                	
                    model.addAttribute( "feedbackMessage", addFeedbackMessageAsString( FEEDBACK_MESSAGE_KEY_SEARCH_RESULTS_MULTIPLE, pagesnpinsertiondeletionTotal.getTotalElements(), successMsg ) );
                }
                
                return SNPINSERTIONDELETION_SEARCH_RESULT_VIEW;
            }

        }
    	catch (Exception e) {

    		e.printStackTrace();
    	}

        return SNPINSERTIONDELETION_SEARCH_VIEW;
    }

    
    /**
     * Processes requests from the home (Search) page which lists all available DTOSearchSNPInsertionDeletion.
     * @param model
     * @return The name of the SNPInsertionDeletion Results, list  view.
     * @method POST
     */
	@RequestMapping(value = REQUEST_SEARCH_MAPPING, method = RequestMethod.POST)
    public String searchPost(
    	@ModelAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA) DTOSearchSNPInsertionDeletion dtoSearch, 
    	Model model, 
    	RedirectAttributes attributes
    	) {
    	
        LOGGER.debug("Searching SNPInsertionDeletions with search criteria: " + dtoSearch);
        
    	int firstPage = 1;
        
    	String successMsg = "";
    	
        PageSNPInsertionDeletion pagesnpinsertiondeletion = null;

    	try {
    		
			successMsg = dtoSearch.isDTOSearchSNPInsertionDeletionValid(serviceensemblgene);
		} 
        catch (ExceptionSNPInsertionDeletionSelectedWithGeneName e) {
        	
        	LOGGER.debug("ERROR: Search Chromosome Supplied AND Ensembl Gene Name Supplied !!!");
            addErrorMessage(model, ERROR_MESSAGE_SEARCH_CHOSEN_CHROMOSOME_AND_GENENAME);
            model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, dtoSearch);
            
            return SNPINSERTIONDELETION_SEARCH_VIEW;
        }
        catch (ExceptionSNPInsertionDeletionNotSelected e) {
        	
        	LOGGER.debug("ERROR: The Search Chromosome has NOT been chosen !!!");
            addErrorMessage(model, ERROR_MESSAGE_SEARCH_NOTCHOSEN_CHROMOSOME_NOT_SELECTED);
            model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, dtoSearch);
            
            return SNPINSERTIONDELETION_SEARCH_VIEW;
        }
        catch (ExceptionSNPInsertionDeletionSearchFilterProteinAlignNumberValueNotNumeric e) {
        	
        	LOGGER.debug("ERROR: The Search Filter Protein Alignment Number is NOT Numeric !!!");
            addErrorMessage(model, ERROR_MESSAGE_SEARCH_FILTER_NOT_NUMERIC_PROTEIN_ALIGN_NUMBER);
            model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, dtoSearch);
            
            return SNPINSERTIONDELETION_SEARCH_VIEW;
        }
        catch (ExceptionSNPInsertionDeletionSearchFilterProveanScoreValueNotNumeric e) {
        	
        	LOGGER.debug("ERROR: The Search Filter PROVEAN Score is NOT Numeric !!!");
            addErrorMessage(model, ERROR_MESSAGE_SEARCH_FILTER_NOT_NUMERIC_PROVEAN_SCORE);
            model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, dtoSearch);
            
            return SNPINSERTIONDELETION_SEARCH_VIEW;
        }
        catch (ExceptionSNPInsertionDeletionSearchFilterSiftConservationScoreValueNotNumeric e) {
        	
        	LOGGER.debug("ERROR: The Search Filter SIFT Conservation Score is NOT Numeric !!!");
            addErrorMessage(model, ERROR_MESSAGE_SEARCH_FILTER_NOT_NUMERIC_SIFT_CONSERVATION_SCORE);
            model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, dtoSearch);
            
            return SNPINSERTIONDELETION_SEARCH_VIEW;
        }
        catch (ExceptionSNPInsertionDeletionSearchFilterSiftScoreValueNotNumeric e) {
        	
        	LOGGER.debug("ERROR: The Search Filter SIFT Score is NOT Numeric !!!");
            addErrorMessage(model, ERROR_MESSAGE_SEARCH_FILTER_NOT_NUMERIC_SIFT_SCORE);
            model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, dtoSearch);
            
            return SNPINSERTIONDELETION_SEARCH_VIEW;
        }
        catch (ExceptionSNPInsertionDeletionSearchFilterTotalNumberSeqAlignedValueNotNumeric e) {
        	
        	LOGGER.debug("ERROR: The Search Filter Total Number of Sequence Aligned is NOT Numeric !!!");
            addErrorMessage(model, ERROR_MESSAGE_SEARCH_FILTER_NOT_NUMERIC_TOTAL_NUMBER_SEQ_ALIGNED);
            model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, dtoSearch);
            
            return SNPINSERTIONDELETION_SEARCH_VIEW;
        }
        catch (ExceptionEnsemblGeneSearchRangeLessThanZero e) {
        	
        	LOGGER.debug("ERROR: Search Range is LESS THAN Zero !!!");
            addErrorMessage(model, ERROR_MESSAGE_SEARCH_RANGE_NEGATIVE);
            model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, dtoSearch);
            
            return SNPINSERTIONDELETION_SEARCH_VIEW;
        }
        catch (ExceptionEnsemblGeneUpStreamSearchRangeGreaterThanTenThousand e) {
        	
        	LOGGER.debug("ERROR: Up Stream Search Range is GREATER THAN Ten Thousand Base Pairs !!!");
            addErrorMessage(model, ERROR_MESSAGE_SEARCH_UPSTREAM_TEN_THOUSAND_BASE_PAIRS);
            model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, dtoSearch);
            
            return SNPINSERTIONDELETION_SEARCH_VIEW;
        }
        catch (ExceptionEnsemblGeneDownStreamSearchRangeGreaterThanTenThousand e) {
        	
        	LOGGER.debug("ERROR: Down Stream Search Range is GREATER THAN Ten Thousand Base Pairs !!!");
            addErrorMessage(model, ERROR_MESSAGE_SEARCH_DOWNSTREAM_TEN_THOUSAND_BASE_PAIRS);
            model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, dtoSearch);
            
            return SNPINSERTIONDELETION_SEARCH_VIEW;
        }
        catch (ExceptionEnsemblGeneUpStreamNotNumeric e) {
        	
        	LOGGER.debug("ERROR: Search Upstream Range is NOT Numeric !!!");
            addErrorMessage(model, ERROR_MESSAGE_SEARCH_NOT_NUMERIC_UP_STREAM);
            model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, dtoSearch);
            
            return SNPINSERTIONDELETION_SEARCH_VIEW;
        }
        catch (ExceptionEnsemblGeneDownStreamNotNumeric e) {
        	
        	LOGGER.debug("ERROR: Search Downstream Range is NOT Numeric !!!");
            addErrorMessage(model, ERROR_MESSAGE_SEARCH_NOT_NUMERIC_DOWN_STREAM);
            model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, dtoSearch);
            
            return SNPINSERTIONDELETION_SEARCH_VIEW;
        }
        catch (ExceptionEnsemblGeneMultiplesFound e) {
        	
        	LOGGER.debug("ERROR: Multiple Genes Found !!!");
            addErrorMessage(model, ERROR_MESSAGE_SEARCH_GENE_NAME_MULTIPLE);
            model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, dtoSearch);
            
            return SNPINSERTIONDELETION_SEARCH_VIEW;
        }
        catch (ExceptionEnsemblGeneNotFound e) {
        	
        	LOGGER.debug("ERROR: Requested Gene does NOT Exist !!!");
            addErrorMessage(model, ERROR_MESSAGE_SEARCH_GENE_NAME_UNKNOWN);
            model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, dtoSearch);
            
            return SNPINSERTIONDELETION_SEARCH_VIEW;
        }
        catch (ExceptionSNPInsertionDeletionSearchRangeGreaterThanOneMillion e) {
        	
        	LOGGER.debug("ERROR: Search Range is GREATER THAN One Million Base Pairs !!!");
            addErrorMessage(model, ERROR_MESSAGE_SEARCH_ONE_MILLION_BASE_PAIRS);
            model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, dtoSearch);
            
            return SNPINSERTIONDELETION_SEARCH_VIEW;
        }
        catch (ExceptionSNPInsertionDeletionLowCoordinateNotNumeric e) {
        	
        	LOGGER.debug("ERROR: Search Low Co-ordinate is NOT Numeric !!!");
            addErrorMessage(model, ERROR_MESSAGE_SEARCH_NOT_NUMERIC_LOW_POSITION);
            model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, dtoSearch);
            
            return SNPINSERTIONDELETION_SEARCH_VIEW;
        }
        catch (ExceptionSNPInsertionDeletionHighCoordinateNotNumeric e) {
        	
        	LOGGER.debug("ERROR: Search High Co-ordinate is NOT Numeric !!!");
        	addErrorMessage(model, ERROR_MESSAGE_SEARCH_NOT_NUMERIC_HIGH_POSITION);
            model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, dtoSearch);
            
            return SNPINSERTIONDELETION_SEARCH_VIEW;
        }
        catch (ExceptionSNPInsertionDeletionLowCoordinateGreaterThanHighCoordinate e) {
        	
        	LOGGER.debug("ERROR: Search Low Co-ordinate is GREATER THAN Search High Co-ordinate !!!");
        	addErrorMessage(model, ERROR_MESSAGE_SEARCH_OUTSIDE_RANGE_LOW_POSITION_GE_HIGH_POSITION);
            model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, dtoSearch);
            
            return SNPINSERTIONDELETION_SEARCH_VIEW;
        }
        catch (ExceptionSNPInsertionDeletionReferenceAlleleNotSupplied e) {
        	
        	LOGGER.debug("ERROR: Reference Allele Not Supplied !!!");
        	addErrorMessage(model, ERROR_MESSAGE_SEARCH_NOTCHOSEN_REFERENCE_NOT_SELECTED);
        	model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, dtoSearch);
        	
            return SNPINSERTIONDELETION_SEARCH_VIEW;
        }
        catch (ExceptionSNPInsertionDeletionAlternativeAlleleNotSupplied e) {
        	
        	LOGGER.debug("ERROR: Alternative Allele Not Supplied !!!");
        	addErrorMessage(model, ERROR_MESSAGE_SEARCH_NOTCHOSEN_ALTERNATIVE_NOT_SELECTED);
        	model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, dtoSearch);
        	
            return SNPINSERTIONDELETION_SEARCH_VIEW;
        }
        catch (ExceptionSNPInsertionDeletionReferenceAlleleEqualsAlternativeAllele e) {
        	
        	LOGGER.debug("ERROR: Reference Allele EQUALS Alternative Allele !!!");
        	addErrorMessage(model, ERROR_MESSAGE_SEARCH_EQUALS_REFERENCE_EQUALS_ALTERNATIVE);
            model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, dtoSearch);
            
            return SNPINSERTIONDELETION_SEARCH_VIEW;
        } 
    	catch (ExceptionSNPInsertionDeletionHighCoordinateNotSupplied e) {
    		
        	LOGGER.debug("ERROR: Search High Co-ordinate is NOT Supplied !!!");
        	addErrorMessage(model, ERROR_MESSAGE_SEARCH_NOT_SUPPLIED_HIGH_POSITION);
            model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, dtoSearch);
            
            return SNPINSERTIONDELETION_SEARCH_VIEW;
		} 
    	catch (ExceptionSNPInsertionDeletionLowCoordinateNotSupplied e) {
    		
        	LOGGER.debug("ERROR: Search Low Co-ordinate is NOT Supplied !!!");
        	addErrorMessage(model, ERROR_MESSAGE_SEARCH_NOT_SUPPLIED_LOW_POSITION);
            model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, dtoSearch);
            
            return SNPINSERTIONDELETION_SEARCH_VIEW;
    	}
    	catch (Exception e) {

    		e.printStackTrace();
    	}
    	
        pagesnpinsertiondeletion = servicesnpinsertiondeletion.search(dtoSearch, firstPage, dtoSearch.getSearchSortFieldAsString(), dtoSearch.getSearchSortDirectionAsString());

        if ( pagesnpinsertiondeletion.size() == 0 ) {
        	
            LOGGER.debug("EMPTY SNPInsertionDeletions !!! ");
        	addFeedbackMessage(model, FEEDBACK_MESSAGE_KEY_SEARCH_RESULTS_MULTIPLE, 0, successMsg);
            model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, dtoSearch);

            return SNPINSERTIONDELETION_SEARCH_VIEW;
        }
        else {

            int current = pagesnpinsertiondeletion.getPageNumber();
            int begin = Math.max(1, current - 5);
            int end = Math.min(begin + 10, pagesnpinsertiondeletion.getTotalPages());
            int totalPages = pagesnpinsertiondeletion.getTotalPages();

            model.addAttribute("SNPInsertionDeletion", pagesnpinsertiondeletion);
            model.addAttribute("beginIndex", begin);
            model.addAttribute("endIndex", end);
            model.addAttribute("currentIndex", current);
            model.addAttribute("totalPages", totalPages);
            
        	DTODownloadSNPInsertionDeletion dtoDownload = new DTODownloadSNPInsertionDeletion( 
        			dtoSearch.getSearchDownStream(),
        	        dtoSearch.getSearchUpStream(),
        			dtoSearch.getSearchLowRange(), 
        			dtoSearch.getSearchHighRange(), 
        			dtoSearch.getSearchReferenceBreed(), 
        			dtoSearch.getSearchAlternativeBreed(), 
        	        dtoSearch.getSearchChromosome(),
        			dtoSearch.getSearchFilterSiftScoreValue(), 
        			dtoSearch.getSearchFilterSiftConservationScoreValue(), 
        			dtoSearch.getSearchFilterProteinAlignNumberValue(), 
        			dtoSearch.getSearchFilterTotalNumberSeqAlignedValue(), 
        			dtoSearch.getSearchFilterProveanScoreValue(), 
        			dtoSearch.getSearchFilterSiftScore(), 
        			dtoSearch.getSearchFilterSiftConservationScore(), 
        			dtoSearch.getSearchFilterProteinAlignNumber(), 
        			dtoSearch.getSearchFilterTotalNumberSeqAligned(), 
        			dtoSearch.getSearchFilterProveanScore(), 
        			dtoSearch.getSearchSortField(), 
        			dtoSearch.getSearchSortDirection(), 
        	        dtoSearch.getSearchUploadFileName(),
        	        dtoSearch.getSearchUploadFile()
        	);

            model.addAttribute(MODEL_ATTRIBUTE_DOWNLOADCRITERIA, dtoDownload);

            if ( pagesnpinsertiondeletion.getTotalElements() == 1 ) {
            	
                model.addAttribute("feedbackMessage", addFeedbackMessageAsString(FEEDBACK_MESSAGE_KEY_SEARCH_RESULTS_SINGLE, pagesnpinsertiondeletion.getTotalElements(), successMsg));
            }
            else {
            	
                model.addAttribute("feedbackMessage", addFeedbackMessageAsString(FEEDBACK_MESSAGE_KEY_SEARCH_RESULTS_MULTIPLE, pagesnpinsertiondeletion.getTotalElements(), successMsg));
            }

            return SNPINSERTIONDELETION_SEARCH_RESULT_VIEW;
        }

    }


    /**
     * Processes requests to home page which lists all available SNPInsertionDeletion.
     * @param model
     * @return The requested Download File.
     * @method POST
     */
	@RequestMapping(value = REQUEST_DOWNLOAD_MAPPING, method = RequestMethod.POST)
    public @ResponseBody CSVResponseSNPInsertionDeletion download( DTODownloadSNPInsertionDeletion dtoDownload ) {
	
		LOGGER.debug("Downloading SNPInsertionDeletions with search criteria: " + dtoDownload);
        
        CSVResponseSNPInsertionDeletion csvresponse = new CSVResponseSNPInsertionDeletion();
        
        csvresponse.setDTODownloadSNPInsertionDeletion(dtoDownload);
        
        try {

            if ( dtoDownload.getSearchUploadFileName().equals("") ) {
            	
                List<SNPInsertionDeletion> snpinsertiondeletions = servicesnpinsertiondeletion.download(dtoDownload);
                
                if ( snpinsertiondeletions == null ) {
                	
                    LOGGER.debug("EMPTY SNPInsertionDeletions !!! ");
                }
                else {

                	csvresponse.addAll( snpinsertiondeletions );
                }
            }
            else {
            	
                File tmpFile = new File( dtoDownload.getSearchUploadFileName() );
                InputStream csvInput = FileUtil.readStream(tmpFile);

        		int totalRequestCount = 0;
        		
                List<DTOSearchSNPInsertionDeletion> dtosearchsnpinsertiondeletionList = ConvertFiletoDTOSearchSNPInsertionDeletionList.run( csvInput, totalRequestCount, MSGLEVEL, MSGLEVEL );

                Iterator<DTOSearchSNPInsertionDeletion> iteratorDTOSearchSNPInsertionDeletion = dtosearchsnpinsertiondeletionList.iterator();

                PageSNPInsertionDeletion pagesnpinsertiondeletionTotal = new PageSNPInsertionDeletion();
                
                pagesnpinsertiondeletionTotal.setPageNumber(1);
                pagesnpinsertiondeletionTotal.setTotalElements(0);
                pagesnpinsertiondeletionTotal.setTotalPages(1);
                
    	    	String successMsg = "";
    	    	
    	     	while ( iteratorDTOSearchSNPInsertionDeletion.hasNext() ) {
    	    		
    	    		DTOSearchSNPInsertionDeletion dtosearchsnpinsertiondeletion = iteratorDTOSearchSNPInsertionDeletion.next();
    	    		
    	            try {
    	            	
    	    			successMsg = dtosearchsnpinsertiondeletion.isDTOSearchSNPInsertionDeletionValid( serviceensemblgene );

    	            }
    	            catch (ExceptionSNPInsertionDeletionSelectedWithGeneName e) {
    	            	
    	            	LOGGER.debug("ERROR: Search Chromosome Supplied AND Ensembl Gene Name Supplied !!!");
    	        		e.printStackTrace();
    	            }
    	            catch (ExceptionSNPInsertionDeletionNotSelected e) {
    	            	
    	            	LOGGER.debug("ERROR: The Search Chromosome has NOT been chosen !!!");
    	        		e.printStackTrace();
    	            }
    	            catch (ExceptionSNPInsertionDeletionSearchFilterProteinAlignNumberValueNotNumeric e) {
    	            	
    	            	LOGGER.debug("ERROR: The Search Filter Protein Alignment Number is NOT Numeric !!!");
    	        		e.printStackTrace();
    	            }
    	            catch (ExceptionSNPInsertionDeletionSearchFilterProveanScoreValueNotNumeric e) {
    	            	
    	            	LOGGER.debug("ERROR: The Search Filter PROVEAN Score is NOT Numeric !!!");
    	        		e.printStackTrace();
    	            }
    	            catch (ExceptionSNPInsertionDeletionSearchFilterSiftConservationScoreValueNotNumeric e) {
    	            	
    	            	LOGGER.debug("ERROR: The Search Filter SIFT Conservation Score is NOT Numeric !!!");
    	        		e.printStackTrace();
    	            }
    	            catch (ExceptionSNPInsertionDeletionSearchFilterSiftScoreValueNotNumeric e) {
    	            	
    	            	LOGGER.debug("ERROR: The Search Filter SIFT Score is NOT Numeric !!!");
    	        		e.printStackTrace();
    	            }
    	            catch (ExceptionSNPInsertionDeletionSearchFilterTotalNumberSeqAlignedValueNotNumeric e) {
    	            	
    	            	LOGGER.debug("ERROR: The Search Filter Total Number of Sequence Aligned is NOT Numeric !!!");
    	        		e.printStackTrace();
    	            }
    	            catch (ExceptionEnsemblGeneSearchRangeLessThanZero e) {
    	            	
    	            	LOGGER.debug("ERROR: Search Range is LESS THAN Zero !!!");
    	        		e.printStackTrace();
    	            }
    	            catch (ExceptionEnsemblGeneUpStreamSearchRangeGreaterThanTenThousand e) {
    	            	
    	            	LOGGER.debug("ERROR: Up Stream Search Range is GREATER THAN Ten Thousand Base Pairs !!!");
    	        		e.printStackTrace();
    	            }
    	            catch (ExceptionEnsemblGeneDownStreamSearchRangeGreaterThanTenThousand e) {
    	            	
    	            	LOGGER.debug("ERROR: Down Stream Search Range is GREATER THAN Ten Thousand Base Pairs !!!");
    	        		e.printStackTrace();
    	            }
    	            catch (ExceptionEnsemblGeneUpStreamNotNumeric e) {
    	            	
    	            	LOGGER.debug("ERROR: Search Upstream Range is NOT Numeric !!!");
    	        		e.printStackTrace();
    	            }
    	            catch (ExceptionEnsemblGeneDownStreamNotNumeric e) {
    	            	
    	            	LOGGER.debug("ERROR: Search Downstream Range is NOT Numeric !!!");
    	        		e.printStackTrace();
    	            }
    	            catch (ExceptionEnsemblGeneMultiplesFound e) {
    	            	
    	            	LOGGER.debug("ERROR: Multiple Genes Found !!!");
    	        		e.printStackTrace();
    	            }
    	            catch (ExceptionEnsemblGeneNotFound e) {
    	            	
    	            	LOGGER.debug("ERROR: Requested Gene does NOT Exist !!!");
    	        		e.printStackTrace();
    	            }
    	            catch (ExceptionSNPInsertionDeletionSearchRangeGreaterThanOneMillion e) {
    	            	
    	            	LOGGER.debug("ERROR: Search Range is GREATER THAN One Million Base Pairs !!!");
    	        		e.printStackTrace();
    	            }
    	            catch (ExceptionSNPInsertionDeletionLowCoordinateNotNumeric e) {
    	            	
    	            	LOGGER.debug("ERROR: Search Low Co-ordinate is NOT Numeric !!!");
    	        		e.printStackTrace();
    	            }
    	            catch (ExceptionSNPInsertionDeletionHighCoordinateNotNumeric e) {
    	            	
    	            	LOGGER.debug("ERROR: Search High Co-ordinate is NOT Numeric !!!");
    	        		e.printStackTrace();
    	            }
    	            catch (ExceptionSNPInsertionDeletionLowCoordinateGreaterThanHighCoordinate e) {
    	            	
    	            	LOGGER.debug("ERROR: Search Low Co-ordinate is GREATER THAN Search High Co-ordinate !!!");
    	        		e.printStackTrace();
    	            }
    	            catch (ExceptionSNPInsertionDeletionReferenceAlleleNotSupplied e) {
    	            	
    	            	LOGGER.debug("ERROR: Reference Allele Not Supplied !!!");
    	        		e.printStackTrace();
    	            }
    	            catch (ExceptionSNPInsertionDeletionAlternativeAlleleNotSupplied e) {
    	            	
    	            	LOGGER.debug("ERROR: Alternative Allele Not Supplied !!!");
    	        		e.printStackTrace();
    	            }
    	            catch (ExceptionSNPInsertionDeletionReferenceAlleleEqualsAlternativeAllele e) {
    	            	
    	            	LOGGER.debug("ERROR: Reference Allele EQUALS Alternative Allele !!!");
    	        		e.printStackTrace();
    	            } 
    	        	catch (ExceptionSNPInsertionDeletionHighCoordinateNotSupplied e) {
    	        		
    	            	LOGGER.debug("ERROR: Search High Co-ordinate is NOT Supplied !!!");
    	        		e.printStackTrace();
    	        	} 
    	        	catch (ExceptionSNPInsertionDeletionLowCoordinateNotSupplied e) {
    	        		
    	            	LOGGER.debug("ERROR: Search Low Co-ordinate is NOT Supplied !!!");
    	        		e.printStackTrace();
    	        	}

            		PageSNPInsertionDeletion pagesnpinsertiondeletionRequest = servicesnpinsertiondeletion.search(dtosearchsnpinsertiondeletion, 1, dtosearchsnpinsertiondeletion.getSearchSortFieldAsString(), dtosearchsnpinsertiondeletion.getSearchSortDirectionAsString());

    	            if ( pagesnpinsertiondeletionRequest.size() != 0 ) {
    	            	
                		Iterator<SNPInsertionDeletion> iteratorSNPInsertionDeletion = pagesnpinsertiondeletionRequest.iterator();

            	     	while ( iteratorSNPInsertionDeletion.hasNext() ) {
            	    		
            	     		SNPInsertionDeletion snpinsertiondeletion = iteratorSNPInsertionDeletion.next();

            	    		if ( !pagesnpinsertiondeletionTotal.contains( snpinsertiondeletion )) {
            	    			
            	    			pagesnpinsertiondeletionTotal.incrementTotalElements();
            	    			
            	    			pagesnpinsertiondeletionTotal.add( snpinsertiondeletion );
            	    		}
            	     	}
    	            }
    	     	}

    	     	csvresponse.addAll( pagesnpinsertiondeletionTotal );
            }
        }
    	catch (Exception e) {

    		e.printStackTrace();
    	}
        
        return csvresponse;
    }

	
    // --------------------------------------------------------------------------------------------
    // TESTING ------------------------------------------------------------------------------------
    // --------------------------------------------------------------------------------------------

	/**
     * This setter method should only be used by unit tests
     * @param serviceSNPInsertionDeletion
     */
    protected void setServiceSNPInsertionDeletion(ServiceSNPInsertionDeletion servicesnpinsertiondeletion) {
        this.servicesnpinsertiondeletion = servicesnpinsertiondeletion;
    }

}
