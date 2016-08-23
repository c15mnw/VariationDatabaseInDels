package com.roslin.mwicks.spring.variation.controller.snpinsertiondeletion;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.io.IOException;

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
import com.roslin.mwicks.spring.variation.exception.snpinsertiondeletion.ExceptionSNPInsertionDeletionLowCoordinateGreaterThanHighCoordinate;
import com.roslin.mwicks.spring.variation.exception.snpinsertiondeletion.ExceptionSNPInsertionDeletionLowCoordinateNotNumeric;
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

import com.roslin.mwicks.spring.variation.model.ensemblgene.EnsemblGene;

import com.roslin.mwicks.spring.variation.model.other.CSVResponseSNPInsertionDeletion;

import com.roslin.mwicks.spring.variation.model.other.PageSNPInsertionDeletion;

import com.roslin.mwicks.spring.variation.model.other.FilteredSNPInsertionDeletion;

import com.roslin.mwicks.spring.variation.model.snpinsertiondeletion.SNPInsertionDeletion;

import com.roslin.mwicks.spring.variation.serviceinterface.ensemblgene.ServiceEnsemblGene;

import com.roslin.mwicks.spring.variation.serviceinterface.snpinsertiondeletion.ServiceSNPInsertionDeletion;

import com.roslin.mwicks.utility.ObjectConverter;


/**
 * @author Mike Wicks
 */
@Controller
@SessionAttributes("SNPInsertionDeletion")
//public class ControllerSNPInsertionDeletion {
public class ControllerSNPInsertionDeletion extends AbstractController {
    
    private static final Logger LOGGER = LoggerFactory.getLogger(ControllerSNPInsertionDeletion.class);
    
    private static final int NUMBER_OF_SNPCHROMOSOMES_ALL = 300000;
    
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

    protected static final String MODEL_ATTIRUTE_SNPCHROMOSOME = "SNPInsertionDeletion";
    protected static final String MODEL_ATTRIBUTE_SNPCHROMOSOMES = "SNPInsertionDeletions";
    
    protected static final String MODEL_ATTRIBUTE_SEARCHCRITERIA = "dtoSearch";
    protected static final String MODEL_ATTRIBUTE_DOWNLOADCRITERIA = "dtoDownload";

    protected static final String MODEL_ATTRIBUTE_LOGINCRITERIA = "loginBean";
    
    protected static final String SNPCHROMOSOME_SEARCH_VIEW = "SNPInsertionDeletion/page_search";
    protected static final String SNPCHROMOSOME_SEARCH_VIEW_HELP = "SNPInsertionDeletion/page_search_help";
    protected static final String SNPCHROMOSOME_SEARCH_RESULT_VIEW = "SNPInsertionDeletion/page_search_results";
    protected static final String SNPCHROMOSOME_SEARCH_RESULT_VIEW_HELP = "SNPInsertionDeletion/page_search_results_help";
    
    protected static final String REQUEST_MAPPING_LIST = "";

    protected static final int ONE_MILLION = 1000000;
    protected static final int TEN_THOUSAND = 10000;

    private static final String FLASH_ERROR_MESSAGE = "errorMessage";
    private static final String FLASH_FEEDBACK_MESSAGE = "feedbackMessage";

    private static final String VIEW_REDIRECT_PREFIX = "redirect:";

    @Resource
    private MessageSource messageSource;
    

    @Resource
    private ServiceSNPInsertionDeletion servicesnpinsertiondeletion;

    
    @Resource
    private ServiceEnsemblGene serviceensemblgene;
    


    /**
     * Processes requests to home page which lists all available SNPInsertionDeletions.
     * @param model
     * @return  The name of the SNPInsertionDeletion list view.
     */
    @RequestMapping(value = "/search_help", method = RequestMethod.GET)
    public String showSearchHelp(
    	Model model
    	) {
    	
        LOGGER.debug("Rendering SNPInsertionDeletion Search Help page");

        return SNPCHROMOSOME_SEARCH_VIEW_HELP;
    }

    
    /**
     * Processes requests to home page which lists all available SNPInsertionDeletions.
     * @param model
     * @return  The name of the SNPInsertionDeletion list view.
     */
    @RequestMapping(value = "/search_results_help", method = RequestMethod.GET)
    public String showSearchResultsHelp(
    	Model model
    	) {
    	
        LOGGER.debug("Rendering SNPInsertionDeletion Search Help page");

        return SNPCHROMOSOME_SEARCH_RESULT_VIEW_HELP;
    }

    
    /**
     * Processes requests to home page which lists all available SNPInsertionDeletions.
     * @param model
     * @return  The name of the SNPInsertionDeletion list view.
     */
    @RequestMapping(value = { "/", "/search" }, method = RequestMethod.GET)
    public String searchGet(
    	Model model
    	) {
    	
        LOGGER.debug("Rendering SNPInsertionDeletion Search page");

    	//System.out.println("searchGet");

    	model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, new DTOSearchSNPInsertionDeletion());

        return SNPCHROMOSOME_SEARCH_VIEW;
    }

    
	@RequestMapping(value = "/search", method = RequestMethod.POST)
    public String searchPost(
    	@ModelAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA) DTOSearchSNPInsertionDeletion dtoSearch, 
    	Model model, 
    	RedirectAttributes attributes
    	) {
    	
        LOGGER.debug("Searching SNPInsertionDeletions with search criteria: " + dtoSearch);
        
    	//System.out.println("searchPost");

    	//System.out.println("dtoSearch : " + dtoSearch.toString());

    	int firstPage = 1;
        
        PageSNPInsertionDeletion pagesnpchromosome = null;
        
        int intSearchLow = 0;
        int intSearchHigh = 0;
        int intSearchLowHighDiff = 0;

        int intSearchUp = 0;
        int intSearchDown = 0;
        
        try {

        	if ( !dtoSearch.isSearchFilterProteinAlignNumberValueEmpty() ) {
        		if ( !dtoSearch.isSearchFilterProteinAlignNumberValueANumber() ) {
        			throw new ExceptionSNPInsertionDeletionSearchFilterProteinAlignNumberValueNotNumeric("ERROR: Search Filter Protein Alignment Number is NOT Numeric : " + dtoSearch.getSearchFilterProteinAlignNumberValue() + " !!!");
        		}
        	}
        	if ( !dtoSearch.isSearchFilterProveanScoreValueEmpty() ) {
        		if ( !dtoSearch.isSearchFilterProveanScoreValueANumber() ) {
        			throw new ExceptionSNPInsertionDeletionSearchFilterProveanScoreValueNotNumeric("ERROR: Search Filter PROVEAN Score is NOT Numeric : " + dtoSearch.getSearchFilterProveanScoreValue() + " !!!");        		}
        	}
        	if ( !dtoSearch.isSearchFilterSiftConservationScoreValueEmpty() ) {
        		if ( !dtoSearch.isSearchFilterSiftConservationScoreValueANumber() ) {
        			throw new ExceptionSNPInsertionDeletionSearchFilterSiftConservationScoreValueNotNumeric("ERROR: Search Filter SIFT Conservation Score is NOT Numeric : " + dtoSearch.getSearchFilterSiftConservationScoreValue() + " !!!");
        		}
        	}
        	if ( !dtoSearch.isSearchFilterSiftScoreValueEmpty() ) {
        		if ( !dtoSearch.isSearchFilterSiftScoreValueANumber() ) {
        			throw new ExceptionSNPInsertionDeletionSearchFilterSiftScoreValueNotNumeric("ERROR: Search Filter SIFT Score is NOT Numeric : " + dtoSearch.getSearchFilterSiftScoreValue() + " !!!");
        		}
        	}
        	if ( !dtoSearch.isSearchFilterTotalNumberSeqAlignedValueEmpty() ) {
        		if ( !dtoSearch.isSearchFilterTotalNumberSeqAlignedValueANumber() ) {
        			throw new ExceptionSNPInsertionDeletionSearchFilterTotalNumberSeqAlignedValueNotNumeric("ERROR: Search Filter Total Number of Sequences Aligned is NOT Numeric : " + dtoSearch.getSearchFilterTotalNumberSeqAlignedValue() + " !!!");
        		}
        	}
        	
        	if ( dtoSearch.isSearchGeneNameEmpty() ) {
        		
        		if ( dtoSearch.isSearchLowRangeEmpty() ) {
        			intSearchLow = 0;
        		}
        		else {
            		if ( dtoSearch.isSearchLowRangeNumeric() ) {
                    	intSearchLow = dtoSearch.getSearchLowRangeAsInt();
                    }
                    else {
                    	throw new ExceptionSNPInsertionDeletionLowCoordinateNotNumeric("ERROR: Search Low Co-ordinate is NOT Numeric : " + dtoSearch.getSearchLowRange() + " !!!");
                    }
        		}
        		if ( dtoSearch.isSearchHighRangeEmpty() ) {
        			intSearchHigh = 0;
        		}
        		else {
                    if ( dtoSearch.isSearchHighRangeNumeric() ) {
                    	intSearchHigh = dtoSearch.getSearchHighRangeAsInt();
                    }
                    else {
                        throw new ExceptionSNPInsertionDeletionHighCoordinateNotNumeric("ERROR: Search High Co-ordinate is NOT Numeric : " + dtoSearch.getSearchHighRange() + " !!!");
                    }
        		}
                if ( intSearchLow > intSearchHigh) {
                    throw new ExceptionSNPInsertionDeletionLowCoordinateGreaterThanHighCoordinate("ERROR: Search Low Co-ordinate (" + intSearchLow + ") is GREATER THAN Search High Co-ordinate (" + intSearchHigh + ") !!!");
                }
                intSearchLowHighDiff = intSearchHigh - intSearchLow;

                //System.out.println("intSearchLowHighDiff : " + intSearchLowHighDiff);

                if ( intSearchLowHighDiff > ONE_MILLION) {
                    throw new ExceptionSNPInsertionDeletionSearchRangeGreaterThanOneMillion("ERROR: Search Range (" + intSearchLowHighDiff + ") is GREATER THAN One Million Base Pairs !!!");
                }
        	}
        	else {
        		
        		if ( !dtoSearch.isSearchChromosomeNone() ) {
        			
                    throw new ExceptionSNPInsertionDeletionSelectedWithGeneName("ERROR: Search Chromosome Supplied AND Ensembl Gene Name Supplied !!!");
        		}
        		if ( dtoSearch.isSearchDownStreamEmpty() ) {
        			dtoSearch.setSearchDownStream("0");
        		}
        		else {
            		if ( dtoSearch.isSearchDownStreamNumeric()) {
            			intSearchDown = dtoSearch.getSearchDownStreamAsInt();
            		}
            		else {
                        throw new ExceptionEnsemblGeneDownStreamNotNumeric("ERROR: Search Downstream Range is NOT Numeric : " + dtoSearch.getSearchDownStream() + " !!!");
            		}
        		}
        		if ( dtoSearch.isSearchUpStreamEmpty() ) {
        			dtoSearch.setSearchUpStream("0");
        		}
        		else {
            		if ( dtoSearch.isSearchUpStreamNumeric()) {
            			intSearchUp = dtoSearch.getSearchUpStreamAsInt();
            		}
            		else {
                        throw new ExceptionEnsemblGeneUpStreamNotNumeric("ERROR: Search Upstream Range is NOT Numeric : " + dtoSearch.getSearchUpStream() + " !!!");
            		}
        		}
                if ( intSearchUp > TEN_THOUSAND) {
                    throw new ExceptionEnsemblGeneUpStreamSearchRangeGreaterThanTenThousand("ERROR: Up Stream Search Range (" + intSearchUp + ") is GREATER THAN Ten Thousand Base Pairs !!!");
                }
                if ( intSearchDown > TEN_THOUSAND) {
                    throw new ExceptionEnsemblGeneDownStreamSearchRangeGreaterThanTenThousand("ERROR: Down Stream Search Range (" + intSearchDown + ") is GREATER THAN Ten Thousand Base Pairs !!!");
                }

                List<EnsemblGene> ensemblgenes = serviceensemblgene.findByGeneName(dtoSearch.getSearchGeneName());
                if ( ensemblgenes.isEmpty() ) {
                    throw new ExceptionEnsemblGeneNotFound("ERROR: Requested Gene does NOT Exist !!!");
                }
                if ( ensemblgenes.size() > 1 ) {
                    throw new ExceptionEnsemblGeneMultiplesFound("ERROR: Multiple Genes Exist !!!");
                }
                
                EnsemblGene ensemblgene = ensemblgenes.get(0);
                
                dtoSearch.setSearchChromosome(ensemblgene.getChromosomeId());
                
            	long searchLowRange = 0;
            	long searchHighRange = 0;
            	
                if ( ensemblgene.isStrandPositive() ) {
                	searchLowRange = ensemblgene.getStart() - dtoSearch.getSearchUpStreamAsInt();
                	searchHighRange = ensemblgene.getEnd() + dtoSearch.getSearchDownStreamAsInt();
                	dtoSearch.setSearchHighRange(ObjectConverter.convert(searchHighRange, String.class));
                	dtoSearch.setSearchLowRange(ObjectConverter.convert(searchLowRange, String.class));
                }
                if ( ensemblgene.isStrandNegative() ) {
                	searchHighRange = ensemblgene.getStart() - dtoSearch.getSearchUpStreamAsInt();
                	searchLowRange = ensemblgene.getEnd() + dtoSearch.getSearchDownStreamAsInt();
                	dtoSearch.setSearchLowRange(ObjectConverter.convert(searchHighRange, String.class));
                	dtoSearch.setSearchHighRange(ObjectConverter.convert(searchLowRange, String.class));
                }
                if ( searchHighRange < 0 ) {
                    throw new ExceptionEnsemblGeneSearchRangeLessThanZero("ERROR: Search Range (" + searchHighRange + ") is LESS THAN Zero !!!");
                }
                if ( searchLowRange < 0 ) {
                    throw new ExceptionEnsemblGeneSearchRangeLessThanZero("ERROR: Search Range (" + searchLowRange + ") is LESS THAN Zero !!!");
                }

        	}

            if ( dtoSearch.isSearchReferenceBreedNone() ) {
                throw new ExceptionSNPInsertionDeletionReferenceAlleleNotSupplied("ERROR: Reference Allele Not Supplied !!!");
            }
            if ( dtoSearch.isSearchAlternativeBreedNone()  ) {
                throw new ExceptionSNPInsertionDeletionAlternativeAlleleNotSupplied("ERROR: Alternative Allele Not Supplied !!!");
            }
            if ( dtoSearch.getSearchReferenceBreed().name().equals(dtoSearch.getSearchAlternativeBreed().name()) ) {
                throw new ExceptionSNPInsertionDeletionReferenceAlleleEqualsAlternativeAllele("ERROR: Reference Allele EQUALS Alternative Allele !!!");
            }

            if ( dtoSearch.isSearchChromosomeNone() ) {
                throw new ExceptionSNPInsertionDeletionNotSelected("ERROR: Search Chromosome Not Supplied !!!");
            }
            else {

            	pagesnpchromosome = servicesnpinsertiondeletion.search(dtoSearch, firstPage, dtoSearch.getSearchSortFieldAsString(), dtoSearch.getSearchSortDirectionAsString());
            	
             	//System.out.println("pagesnpchromosome.size() : " + pagesnpchromosome.size() );

            }
            
        } 
        catch (ExceptionSNPInsertionDeletionSelectedWithGeneName e) {
        	LOGGER.debug("ERROR: Search Chromosome Supplied AND Ensembl Gene Name Supplied !!!");
            addErrorMessage(attributes, ERROR_MESSAGE_SEARCH_CHOSEN_CHROMOSOME_AND_GENENAME);
            model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, pagesnpchromosome);
            return createRedirectViewPath(REQUEST_MAPPING_LIST);
        }
        catch (ExceptionSNPInsertionDeletionNotSelected e) {
        	LOGGER.debug("ERROR: The Search Chromosome has NOT been chosen !!!");
            addErrorMessage(attributes, ERROR_MESSAGE_SEARCH_NOTCHOSEN_CHROMOSOME_NOT_SELECTED);
            model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, pagesnpchromosome);
            return createRedirectViewPath(REQUEST_MAPPING_LIST);
        }
        catch (ExceptionSNPInsertionDeletionSearchFilterProteinAlignNumberValueNotNumeric e) {
        	LOGGER.debug("ERROR: The Search Filter Protein Alignment Number is NOT Numeric !!!");
            addErrorMessage(attributes, ERROR_MESSAGE_SEARCH_FILTER_NOT_NUMERIC_PROTEIN_ALIGN_NUMBER);
            model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, pagesnpchromosome);
            return createRedirectViewPath(REQUEST_MAPPING_LIST);
        }
        catch (ExceptionSNPInsertionDeletionSearchFilterProveanScoreValueNotNumeric e) {
        	LOGGER.debug("ERROR: The Search Filter PROVEAN Score is NOT Numeric !!!");
            addErrorMessage(attributes, ERROR_MESSAGE_SEARCH_FILTER_NOT_NUMERIC_PROVEAN_SCORE);
            model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, pagesnpchromosome);
            return createRedirectViewPath(REQUEST_MAPPING_LIST);
        }
        catch (ExceptionSNPInsertionDeletionSearchFilterSiftConservationScoreValueNotNumeric e) {
        	LOGGER.debug("ERROR: The Search Filter SIFT Conservation Score is NOT Numeric !!!");
            addErrorMessage(attributes, ERROR_MESSAGE_SEARCH_FILTER_NOT_NUMERIC_SIFT_CONSERVATION_SCORE);
            model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, pagesnpchromosome);
            return createRedirectViewPath(REQUEST_MAPPING_LIST);
        }
        catch (ExceptionSNPInsertionDeletionSearchFilterSiftScoreValueNotNumeric e) {
        	LOGGER.debug("ERROR: The Search Filter SIFT Score is NOT Numeric !!!");
            addErrorMessage(attributes, ERROR_MESSAGE_SEARCH_FILTER_NOT_NUMERIC_SIFT_SCORE);
            model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, pagesnpchromosome);
            return createRedirectViewPath(REQUEST_MAPPING_LIST);
        }
        catch (ExceptionSNPInsertionDeletionSearchFilterTotalNumberSeqAlignedValueNotNumeric e) {
        	LOGGER.debug("ERROR: The Search Filter Total Number of Sequence Aligned is NOT Numeric !!!");
            addErrorMessage(attributes, ERROR_MESSAGE_SEARCH_FILTER_NOT_NUMERIC_TOTAL_NUMBER_SEQ_ALIGNED);
            model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, pagesnpchromosome);
            return createRedirectViewPath(REQUEST_MAPPING_LIST);
        }
        catch (ExceptionEnsemblGeneSearchRangeLessThanZero e) {
        	LOGGER.debug("ERROR: Search Range is LESS THAN Zero !!!");
            addErrorMessage(attributes, ERROR_MESSAGE_SEARCH_RANGE_NEGATIVE);
            model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, pagesnpchromosome);
            return createRedirectViewPath(REQUEST_MAPPING_LIST);
        }
        catch (ExceptionEnsemblGeneUpStreamSearchRangeGreaterThanTenThousand e) {
        	LOGGER.debug("ERROR: Up Stream Search Range is GREATER THAN Ten Thousand Base Pairs !!!");
            addErrorMessage(attributes, ERROR_MESSAGE_SEARCH_UPSTREAM_TEN_THOUSAND_BASE_PAIRS);
            model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, pagesnpchromosome);
            return createRedirectViewPath(REQUEST_MAPPING_LIST);
        }
        catch (ExceptionEnsemblGeneDownStreamSearchRangeGreaterThanTenThousand e) {
        	LOGGER.debug("ERROR: Down Stream Search Range is GREATER THAN Ten Thousand Base Pairs !!!");
            addErrorMessage(attributes, ERROR_MESSAGE_SEARCH_DOWNSTREAM_TEN_THOUSAND_BASE_PAIRS);
            model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, pagesnpchromosome);
            return createRedirectViewPath(REQUEST_MAPPING_LIST);
        }
        catch (ExceptionEnsemblGeneUpStreamNotNumeric e) {
        	LOGGER.debug("ERROR: Search Upstream Range is NOT Numeric !!!");
            addErrorMessage(attributes, ERROR_MESSAGE_SEARCH_NOT_NUMERIC_UP_STREAM);
            model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, pagesnpchromosome);
            return createRedirectViewPath(REQUEST_MAPPING_LIST);
        }
        catch (ExceptionEnsemblGeneDownStreamNotNumeric e) {
        	LOGGER.debug("ERROR: Search Downstream Range is NOT Numeric !!!");
            addErrorMessage(attributes, ERROR_MESSAGE_SEARCH_NOT_NUMERIC_DOWN_STREAM);
            model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, pagesnpchromosome);
            return createRedirectViewPath(REQUEST_MAPPING_LIST);
        }
        catch (ExceptionEnsemblGeneMultiplesFound e) {
        	LOGGER.debug("ERROR: Multiple Genes Found !!!");
            addErrorMessage(attributes, ERROR_MESSAGE_SEARCH_GENE_NAME_MULTIPLE);
            model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, pagesnpchromosome);
            return createRedirectViewPath(REQUEST_MAPPING_LIST);
        }
        catch (ExceptionEnsemblGeneNotFound e) {
        	LOGGER.debug("ERROR: Requested Gene does NOT Exist !!!");
            addErrorMessage(attributes, ERROR_MESSAGE_SEARCH_GENE_NAME_UNKNOWN);
            model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, pagesnpchromosome);
            return createRedirectViewPath(REQUEST_MAPPING_LIST);
        }
        catch (ExceptionSNPInsertionDeletionSearchRangeGreaterThanOneMillion e) {
        	LOGGER.debug("ERROR: Search Range is GREATER THAN One Million Base Pairs !!!");
            addErrorMessage(attributes, ERROR_MESSAGE_SEARCH_ONE_MILLION_BASE_PAIRS);
            model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, pagesnpchromosome);
            return createRedirectViewPath(REQUEST_MAPPING_LIST);
        }
        catch (ExceptionSNPInsertionDeletionLowCoordinateNotNumeric e) {
        	LOGGER.debug("ERROR: Search Low Co-ordinate is NOT Numeric !!!");
            addErrorMessage(attributes, ERROR_MESSAGE_SEARCH_NOT_NUMERIC_LOW_POSITION);
            model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, pagesnpchromosome);
            return createRedirectViewPath(REQUEST_MAPPING_LIST);
        }
        catch (ExceptionSNPInsertionDeletionHighCoordinateNotNumeric e) {
        	LOGGER.debug("ERROR: Search High Co-ordinate is NOT Numeric !!!");
        	addErrorMessage(attributes, ERROR_MESSAGE_SEARCH_NOT_NUMERIC_HIGH_POSITION);
            model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, pagesnpchromosome);
            return createRedirectViewPath(REQUEST_MAPPING_LIST);
        }
        catch (ExceptionSNPInsertionDeletionLowCoordinateGreaterThanHighCoordinate e) {
        	LOGGER.debug("ERROR: Search Low Co-ordinate is GREATER THAN Search High Co-ordinate !!!");
        	addErrorMessage(attributes, ERROR_MESSAGE_SEARCH_OUTSIDE_RANGE_LOW_POSITION_GE_HIGH_POSITION);
            model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, pagesnpchromosome);
            return createRedirectViewPath(REQUEST_MAPPING_LIST);
        }
        catch (ExceptionSNPInsertionDeletionReferenceAlleleNotSupplied e) {
        	LOGGER.debug("ERROR: Reference Allele Not Supplied !!!");
        	addErrorMessage(attributes, ERROR_MESSAGE_SEARCH_NOTCHOSEN_REFERENCE_NOT_SELECTED);
        	model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, pagesnpchromosome);
            return createRedirectViewPath(REQUEST_MAPPING_LIST);
        }
        catch (ExceptionSNPInsertionDeletionAlternativeAlleleNotSupplied e) {
        	LOGGER.debug("ERROR: Alternative Allele Not Supplied !!!");
        	addErrorMessage(attributes, ERROR_MESSAGE_SEARCH_NOTCHOSEN_ALTERNATIVE_NOT_SELECTED);
        	model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, pagesnpchromosome);
            return createRedirectViewPath(REQUEST_MAPPING_LIST);
        }
        catch (ExceptionSNPInsertionDeletionReferenceAlleleEqualsAlternativeAllele e) {
        	LOGGER.debug("ERROR: Reference Allele EQUALS Alternative Allele !!!");
        	addErrorMessage(attributes, ERROR_MESSAGE_SEARCH_EQUALS_REFERENCE_EQUALS_ALTERNATIVE);
            model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, pagesnpchromosome);
            return createRedirectViewPath(REQUEST_MAPPING_LIST);
        }
        
        if ( pagesnpchromosome == null ) {
            LOGGER.debug("EMPTY SNPInsertionDeletions !!! ");
            
            model.addAttribute("feedbackMessage", addFeedbackMessageAsString(FEEDBACK_MESSAGE_KEY_SEARCH_RESULTS_MULTIPLE, 0));
        }
        else {

            int current = pagesnpchromosome.getPageNumber();
            int begin = Math.max(1, current - 5);
            int end = Math.min(begin + 10, pagesnpchromosome.getTotalPages());
            int totalPages = pagesnpchromosome.getTotalPages();

            model.addAttribute("SNPInsertionDeletion", pagesnpchromosome);
            model.addAttribute("beginIndex", begin);
            model.addAttribute("endIndex", end);
            model.addAttribute("currentIndex", current);
            model.addAttribute("totalPages", totalPages);
            
        	DTODownloadSNPInsertionDeletion dtoDownload = new DTODownloadSNPInsertionDeletion();
            
            dtoDownload.setDownloadChromosome(dtoSearch.getSearchChromosome());
            
            dtoDownload.setDownloadLowRange(dtoSearch.getSearchLowRange());
            dtoDownload.setDownloadHighRange(dtoSearch.getSearchHighRange());
            
            dtoDownload.setDownloadReference(dtoSearch.getSearchReferenceBreed());
            dtoDownload.setDownloadAlternative(dtoSearch.getSearchAlternativeBreed());
            
            dtoDownload.setDownloadFilterSiftScoreValue(dtoSearch.getSearchFilterSiftScoreValue());
            dtoDownload.setDownloadFilterSiftConservationScoreValue(dtoSearch.getSearchFilterSiftConservationScoreValue());
            dtoDownload.setDownloadFilterProteinAlignNumberValue(dtoSearch.getSearchFilterProteinAlignNumberValue());
            dtoDownload.setDownloadFilterTotalNumberSeqAlignedValue(dtoSearch.getSearchFilterTotalNumberSeqAlignedValue());
            dtoDownload.setDownloadFilterProveanScoreValue(dtoSearch.getSearchFilterProveanScoreValue());

            dtoDownload.setDownloadFilterSiftScore(dtoSearch.getSearchFilterSiftScore());
            dtoDownload.setDownloadFilterSiftConservationScore(dtoSearch.getSearchFilterSiftConservationScore());
            dtoDownload.setDownloadFilterProteinAlignNumber(dtoSearch.getSearchFilterProteinAlignNumber());
            dtoDownload.setDownloadFilterTotalNumberSeqAligned(dtoSearch.getSearchFilterTotalNumberSeqAligned());
            dtoDownload.setDownloadFilterProveanScore(dtoSearch.getSearchFilterProveanScore());

            dtoDownload.setDownloadSortDirection(dtoSearch.getSearchSortDirection());
            dtoDownload.setDownloadSortField(dtoSearch.getSearchSortField());

            model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, dtoSearch);
            model.addAttribute(MODEL_ATTRIBUTE_DOWNLOADCRITERIA, dtoDownload);

            if ( pagesnpchromosome.getTotalElements() == 1 ) {
                model.addAttribute("feedbackMessage", addFeedbackMessageAsString(FEEDBACK_MESSAGE_KEY_SEARCH_RESULTS_SINGLE, pagesnpchromosome.getTotalElements()));
            }
            else {
                model.addAttribute("feedbackMessage", addFeedbackMessageAsString(FEEDBACK_MESSAGE_KEY_SEARCH_RESULTS_MULTIPLE, pagesnpchromosome.getTotalElements()));
            }
        }

        return SNPCHROMOSOME_SEARCH_RESULT_VIEW;
    }
    

	@RequestMapping(value = "/results/{pageNumber}", method = RequestMethod.GET)
	public String getSearchedSNPInsertionDeletionPage(
    	@PathVariable Integer pageNumber, 
    	@RequestParam(value = "chr", required = true) String chr,
    	@RequestParam(value = "low", required = true) String low,
    	@RequestParam(value = "high", required = true) String high,
    	@RequestParam(value = "ref", required = true) String ref,
    	@RequestParam(value = "alt", required = true) String alt,
    	@RequestParam(value = "sortfield", required = false) String sortfield,
    	@RequestParam(value = "sortdir", required = false) String sortdir,
    	@ModelAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA) DTOSearchSNPInsertionDeletion dtoSearch,
    	@ModelAttribute(MODEL_ATTRIBUTE_DOWNLOADCRITERIA) DTODownloadSNPInsertionDeletion dtoDownload,
    	Model model, 
    	RedirectAttributes attributes
    	) {
    	
    	//System.out.println("getSearchedSNPInsertionDeletionPage");

        dtoSearch = new DTOSearchSNPInsertionDeletion();
        
        dtoSearch.setPageIndex(pageNumber);
        dtoSearch.setSearchChromosome(chr);
        dtoSearch.setSearchLowRange(low);
        dtoSearch.setSearchHighRange(high);
        dtoSearch.setSearchReferenceBreed(ref);
        dtoSearch.setSearchAlternativeBreed(alt);
        dtoSearch.setSearchSortDirection(sortdir);
        dtoSearch.setSearchSortField(sortfield);

        PageSNPInsertionDeletion pagesnpchromosome = servicesnpinsertiondeletion.search(dtoSearch, pageNumber, dtoSearch.getSearchSortFieldAsString(), dtoSearch.getSearchSortDirectionAsString());

        if ( pagesnpchromosome == null ) {
        	
            LOGGER.debug("EMPTY SNPInsertionDeletions !!! ");
            model.addAttribute("feedbackMessage", addFeedbackMessageAsString(FEEDBACK_MESSAGE_KEY_SEARCH_RESULTS_MULTIPLE, 0));
        }
        else {
        	
            if ( pagesnpchromosome.getTotalElements() == 1 ) {
            	
                model.addAttribute("feedbackMessage", addFeedbackMessageAsString(FEEDBACK_MESSAGE_KEY_SEARCH_RESULTS_SINGLE, pagesnpchromosome.getTotalElements()));
            }
            else {
            	
                model.addAttribute("feedbackMessage", addFeedbackMessageAsString(FEEDBACK_MESSAGE_KEY_SEARCH_RESULTS_MULTIPLE, pagesnpchromosome.getTotalElements()));
            }
            
        	//pagesnpchromosome
            int current = pagesnpchromosome.getPageNumber();
            int begin = Math.max(1, current - 5);
            int end = Math.min(begin + 10, pagesnpchromosome.getTotalPages());
            int totalPages = pagesnpchromosome.getTotalPages();

            model.addAttribute("SNPInsertionDeletion", pagesnpchromosome);
            model.addAttribute("beginIndex", begin);
            model.addAttribute("endIndex", end);
            model.addAttribute("currentIndex", current);
            model.addAttribute("totalPages", totalPages);

            dtoDownload = new DTODownloadSNPInsertionDeletion();
            
            dtoDownload.setDownloadChromosome(dtoSearch.getSearchChromosome());
            dtoDownload.setDownloadLowRange(dtoSearch.getSearchLowRange());
            dtoDownload.setDownloadHighRange(dtoSearch.getSearchHighRange());
            dtoDownload.setDownloadReference(dtoSearch.getSearchReferenceBreed());
            dtoDownload.setDownloadAlternative(dtoSearch.getSearchAlternativeBreed());

            dtoDownload.setDownloadFilterSiftScoreValue(dtoSearch.getSearchFilterSiftScoreValue());
            dtoDownload.setDownloadFilterSiftConservationScoreValue(dtoSearch.getSearchFilterSiftConservationScoreValue());
            dtoDownload.setDownloadFilterProteinAlignNumberValue(dtoSearch.getSearchFilterProteinAlignNumberValue());
            dtoDownload.setDownloadFilterTotalNumberSeqAlignedValue(dtoSearch.getSearchFilterTotalNumberSeqAlignedValue());
            dtoDownload.setDownloadFilterProveanScoreValue(dtoSearch.getSearchFilterProveanScoreValue());
            dtoDownload.setDownloadFilterSiftScore(dtoSearch.getSearchFilterSiftScore());
            dtoDownload.setDownloadFilterSiftConservationScore(dtoSearch.getSearchFilterSiftConservationScore());
            dtoDownload.setDownloadFilterProteinAlignNumber(dtoSearch.getSearchFilterProteinAlignNumber());
            dtoDownload.setDownloadFilterTotalNumberSeqAligned(dtoSearch.getSearchFilterTotalNumberSeqAligned());
            dtoDownload.setDownloadFilterProveanScore(dtoSearch.getSearchFilterProveanScore());

            dtoDownload.setDownloadSortDirection(dtoSearch.getSearchSortDirection());
            dtoDownload.setDownloadSortField(dtoSearch.getSearchSortField());

            model.addAttribute(MODEL_ATTRIBUTE_SEARCHCRITERIA, dtoSearch);
            model.addAttribute(MODEL_ATTRIBUTE_DOWNLOADCRITERIA, dtoDownload);
        }

        return SNPCHROMOSOME_SEARCH_RESULT_VIEW;
    }


	@RequestMapping(value = "/download", method = RequestMethod.POST)
	public @ResponseBody CSVResponseSNPInsertionDeletion download(
		DTODownloadSNPInsertionDeletion dtoDownload
		) throws IOException {
    	
        LOGGER.debug("Downloading SNPInsertionDeletions with search criteria: " + dtoDownload);
        
        CSVResponseSNPInsertionDeletion csvresponse = new CSVResponseSNPInsertionDeletion();

        List<SNPInsertionDeletion> snpchromosomes = servicesnpinsertiondeletion.download(dtoDownload);
        
        csvresponse.setDTODownloadSNPInsertionDeletion(dtoDownload);
        
        if ( snpchromosomes == null ) {
        	
            LOGGER.debug("EMPTY SNPInsertionDeletions !!! ");
        }
        else {

        	csvresponse.addAll( snpchromosomes );
        }
        
        return csvresponse;
    }


	/**
     * This setter method should only be used by unit tests
     * @param serviceSNPInsertionDeletion
     */
    protected void setServiceSNPInsertionDeletion(ServiceSNPInsertionDeletion servicesnpinsertiondeletion) {
        this.servicesnpinsertiondeletion = servicesnpinsertiondeletion;
    }

}
