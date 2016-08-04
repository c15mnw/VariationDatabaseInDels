<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<c:if test="${SNPInsertionDeletion != null && totalPages != 0}">
  <div class="row spacer">
    <div class="span12">
      <table class="table table-bordered table-condensed">
        <thead>

          <c:if test="${dtoDownload.isDownloadSortFieldPosition() || dtoDownload.isDownloadSortFieldNone()}">
            <tr>
              <td>
                <spring:message code="snpinsertiondeletion.list.label.chromosomeId"/>                
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#chromosomeIdentifier" target="_blank" data-toggle="tooltip" data-placement="right" title="Chromosome Id">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
              <td>
                <c:if test="${dtoDownload.isDownloadSortDirectionAsc()}">
                  <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=position&sortdir=desc" >
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-213-arrow-down.png" alt="DOWN" height="15" width="15">
                    <spring:message code="snpinsertiondeletion.list.label.position"/>
                  </a>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#position" target="_blank" data-toggle="tooltip" data-placement="right" title="Position">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </c:if>
                <c:if test="${dtoDownload.isDownloadSortDirectionDesc()}">
                  <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=position&sortdir=asc" >
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                    <spring:message code="snpinsertiondeletion.list.label.position"/>
                  </a>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#position" target="_blank" data-toggle="tooltip" data-placement="right" title="Position">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </c:if>
              </td>
              <td>
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=reference&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.reference"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#referenceAllele" target="_blank" data-toggle="tooltip" data-placement="right" title="Reference Allele">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
              <td>
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=alternative&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.alternative"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#alternativeAllele" target="_blank" data-toggle="tooltip" data-placement="right" title="Alternative Allele">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
              <c:if test="${dtoDownload.isDownloadReferenceBreedI() || dtoDownload.isDownloadAlternativeBreedI()}">
                <td>
                  <spring:message code="snpinsertiondeletion.list.label.breedIAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed I">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </td>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedJ() || dtoDownload.isDownloadAlternativeBreedJ()}">
                <td>
                  <spring:message code="snpinsertiondeletion.list.label.breedJAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed J">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </td>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedW() || dtoDownload.isDownloadAlternativeBreedW()}">
                <td>
                  <spring:message code="snpinsertiondeletion.list.label.breedWAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed W">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </td>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedN() || dtoDownload.isDownloadAlternativeBreedN()}">
                <td>
                  <spring:message code="snpinsertiondeletion.list.label.breedNAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed N">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </td>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedL() || dtoDownload.isDownloadAlternativeBreedL()}">
                <td>
                  <spring:message code="snpinsertiondeletion.list.label.breedLAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed L">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </td>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedZ() || dtoDownload.isDownloadAlternativeBreedZ()}">
                <td>
                  <spring:message code="snpinsertiondeletion.list.label.breedZAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed Z">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </td>
              </c:if>
              <td>
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=aminoAcidSubs&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.aminoAcidSubs"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#aminoAcidSubsInfo" target="_blank" data-toggle="tooltip" data-placement="right" title="Amino Acid Substitution Information">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
              <td>
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=predictionCategory&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.predictionCategory"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#predictionCategory" target="_blank" data-toggle="tooltip" data-placement="right" title="Prediction Category">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
              <td>
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=scoreProvean&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.scoreProvean"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#proveanScore" target="_blank" data-toggle="tooltip" data-placement="right" title="PROVEAN Score">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
              <td>
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=scoreSift&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.scoreSift"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#siftScore" target="_blank" data-toggle="tooltip" data-placement="right" title="SIFT Score">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
              <td>
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=scoreConservation&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.scoreConservation"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#siftConsScore" target="_blank" data-toggle="tooltip" data-placement="right" title="SIFT Conservation Score">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
              <td>
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=proteinAlignNumber&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.proteinAlignNumber"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#proteinAlignNum" target="_blank" data-toggle="tooltip" data-placement="right" title="Protein Alignment Number">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
              <td>
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=totalAlignSequenceNumber&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.totalAlignSequenceNumber"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#totNumSeqAligned" target="_blank" data-toggle="tooltip" data-placement="right" title="Total Number of Sequence Aligned">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
            </tr>
          </c:if>
          
          <c:if test="${dtoDownload.isDownloadSortFieldReference()}">
            <tr>
              <td>
                <spring:message code="snpinsertiondeletion.list.label.chromosomeId"/>                
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#chromosomeIdentifier" target="_blank" data-toggle="tooltip" data-placement="right" title="Chromosome Id">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>

              </td>
              <td>
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=position&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.position"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#position" target="_blank" data-toggle="tooltip" data-placement="right" title="Position">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
              <td>
                <c:if test="${dtoDownload.isDownloadSortDirectionAsc()}">
                  <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=reference&sortdir=desc" >
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-213-arrow-down.png" alt="DOWN" height="15" width="15">
                    <spring:message code="snpinsertiondeletion.list.label.reference"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#referenceAllele" target="_blank" data-toggle="tooltip" data-placement="right" title="Reference Allele">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </c:if>
                <c:if test="${dtoDownload.isDownloadSortDirectionDesc()}">
                  <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=reference&sortdir=asc" >
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                    <spring:message code="snpinsertiondeletion.list.label.reference"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#referenceAllele" target="_blank" data-toggle="tooltip" data-placement="right" title="Reference Allele">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </c:if>
              </td>
              <td>
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=alternative&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.alternative"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#alternativeAllele" target="_blank" data-toggle="tooltip" data-placement="right" title="Alternative Allele">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
              <c:if test="${dtoDownload.isDownloadReferenceBreedI() || dtoDownload.isDownloadAlternativeBreedI()}">
                <td>
                  <spring:message code="snpinsertiondeletion.list.label.breedIAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed I">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </td>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedJ() || dtoDownload.isDownloadAlternativeBreedJ()}">
                <td>
                  <spring:message code="snpinsertiondeletion.list.label.breedJAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed J">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </td>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedW() || dtoDownload.isDownloadAlternativeBreedW()}">
                <td>
                  <spring:message code="snpinsertiondeletion.list.label.breedWAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed W">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </td>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedN() || dtoDownload.isDownloadAlternativeBreedN()}">
                <td>
                  <spring:message code="snpinsertiondeletion.list.label.breedNAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed N">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </td>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedL() || dtoDownload.isDownloadAlternativeBreedL()}">
                <td>
                  <spring:message code="snpinsertiondeletion.list.label.breedLAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed L">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </td>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedZ() || dtoDownload.isDownloadAlternativeBreedZ()}">
                <td>
                  <spring:message code="snpinsertiondeletion.list.label.breedZAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed Z">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </td>
              </c:if>
              <td>
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=aminoAcidSubs&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.aminoAcidSubs"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#aminoAcidSubsInfo" target="_blank" data-toggle="tooltip" data-placement="right" title="Amino Acid Substitution Information">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
              <td>
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=predictionCategory&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.predictionCategory"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#predictionCategory" target="_blank" data-toggle="tooltip" data-placement="right" title="Prediction Category">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
              <td>
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=scoreProvean&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.scoreProvean"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#proveanScore" target="_blank" data-toggle="tooltip" data-placement="right" title="PROVEAN Score">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
              <td>
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=scoreSift&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.scoreSift"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#siftScore" target="_blank" data-toggle="tooltip" data-placement="right" title="SIFT Score">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
              <td>
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=scoreConservation&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.scoreConservation"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#siftConsScore" target="_blank" data-toggle="tooltip" data-placement="right" title="SIFT Conservation Score">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
              <td>
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=proteinAlignNumber&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.proteinAlignNumber"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#proteinAlignNum" target="_blank" data-toggle="tooltip" data-placement="right" title="Protein Alignment Number">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
              <td>
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=totalAlignSequenceNumber&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.totalAlignSequenceNumber"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#totNumSeqAligned" target="_blank" data-toggle="tooltip" data-placement="right" title="Total Number of Sequence Aligned">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
            </tr>
          </c:if>
          
          <c:if test="${dtoDownload.isDownloadSortFieldAlternative()}">
            <tr>
              <td>
                <spring:message code="snpinsertiondeletion.list.label.chromosomeId"/>
<br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#chromosomeIdentifier" target="_blank" data-toggle="tooltip" data-placement="right" title="Chromosome Id">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>

              </td>
              <td>
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=position&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.position"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#position" target="_blank" data-toggle="tooltip" data-placement="right" title="Position">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
              <td>
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=reference&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.reference"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#referenceAllele" target="_blank" data-toggle="tooltip" data-placement="right" title="Reference Allele">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
              <td>
                <c:if test="${dtoDownload.isDownloadSortDirectionAsc()}">
                  <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=alternative&sortdir=desc" >
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-213-arrow-down.png" alt="DOWN" height="15" width="15">
                    <spring:message code="snpinsertiondeletion.list.label.alternative"/>
                  </a>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#alternativeAllele" target="_blank" data-toggle="tooltip" data-placement="right" title="Alternative Allele">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </c:if>
                <c:if test="${dtoDownload.isDownloadSortDirectionDesc()}">
                  <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=alternative&sortdir=asc" >
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                    <spring:message code="snpinsertiondeletion.list.label.alternative"/>
                  </a>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#alternativeAllele" target="_blank" data-toggle="tooltip" data-placement="right" title="Alternative Allele">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </c:if>
              </td>
              <c:if test="${dtoDownload.isDownloadReferenceBreedI() || dtoDownload.isDownloadAlternativeBreedI()}">
                <td>
                  <spring:message code="snpinsertiondeletion.list.label.breedIAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed I">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </td>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedJ() || dtoDownload.isDownloadAlternativeBreedJ()}">
                <td>
                  <spring:message code="snpinsertiondeletion.list.label.breedJAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed J">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </td>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedW() || dtoDownload.isDownloadAlternativeBreedW()}">
                <td>
                  <spring:message code="snpinsertiondeletion.list.label.breedWAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed W">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </td>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedN() || dtoDownload.isDownloadAlternativeBreedN()}">
                <td>
                  <spring:message code="snpinsertiondeletion.list.label.breedNAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed N">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </td>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedL() || dtoDownload.isDownloadAlternativeBreedL()}">
                <td>
                  <spring:message code="snpinsertiondeletion.list.label.breedLAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed L">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </td>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedZ() || dtoDownload.isDownloadAlternativeBreedZ()}">
                <td>
                  <spring:message code="snpinsertiondeletion.list.label.breedZAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed Z">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </td>
              </c:if>
              <td>
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=aminoAcidSubs&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.aminoAcidSubs"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#aminoAcidSubsInfo" target="_blank" data-toggle="tooltip" data-placement="right" title="Amino Acid Substitution Information">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
              <td>
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=predictionCategory&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.predictionCategory"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#predictionCategory" target="_blank" data-toggle="tooltip" data-placement="right" title="Prediction Category">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
              <td>
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=scoreProvean&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.scoreProvean"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#proveanScore" target="_blank" data-toggle="tooltip" data-placement="right" title="PROVEAN Score">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
              <td>
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=scoreSift&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.scoreSift"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#siftScore" target="_blank" data-toggle="tooltip" data-placement="right" title="SIFT Score">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
              <td>
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=scoreConservation&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.scoreConservation"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#siftConsScore" target="_blank" data-toggle="tooltip" data-placement="right" title="SIFT Conservation Score">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
              <td>
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=proteinAlignNumber&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.proteinAlignNumber"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#proteinAlignNum" target="_blank" data-toggle="tooltip" data-placement="right" title="Protein Alignment Number">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
              <td>
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=totalAlignSequenceNumber&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.totalAlignSequenceNumber"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#totNumSeqAligned" target="_blank" data-toggle="tooltip" data-placement="right" title="Total Number of Sequence Aligned">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
            </tr>
          </c:if>
          
          
          <c:if test="${dtoDownload.isDownloadSortFieldAminoAcidSubs()}">
            <tr>
              <td>
                <spring:message code="snpinsertiondeletion.list.label.chromosomeId"/>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#chromosomeIdentifier" target="_blank" data-toggle="tooltip" data-placement="right" title="Chromosome Id">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
              <td>
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=position&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.position"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#position" target="_blank" data-toggle="tooltip" data-placement="right" title="Position">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
              <td>
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=reference&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.reference"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#referenceAllele" target="_blank" data-toggle="tooltip" data-placement="right" title="Reference Allele">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
              <td>
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=alternative&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.alternative"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#alternativeAllele" target="_blank" data-toggle="tooltip" data-placement="right" title="Alternative Allele">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
              <c:if test="${dtoDownload.isDownloadReferenceBreedI() || dtoDownload.isDownloadAlternativeBreedI()}">
                <td>
                  <spring:message code="snpinsertiondeletion.list.label.breedIAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed I">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </td>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedJ() || dtoDownload.isDownloadAlternativeBreedJ()}">
                <td>
                  <spring:message code="snpinsertiondeletion.list.label.breedJAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed J">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </td>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedW() || dtoDownload.isDownloadAlternativeBreedW()}">
                <td>
                  <spring:message code="snpinsertiondeletion.list.label.breedWAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed W">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </td>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedN() || dtoDownload.isDownloadAlternativeBreedN()}">
                <td>
                  <spring:message code="snpinsertiondeletion.list.label.breedNAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed N">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </td>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedL() || dtoDownload.isDownloadAlternativeBreedL()}">
                <td>
                  <spring:message code="snpinsertiondeletion.list.label.breedLAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed L">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </td>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedZ() || dtoDownload.isDownloadAlternativeBreedZ()}">
                <td>
                  <spring:message code="snpinsertiondeletion.list.label.breedZAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed Z">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </td>
              </c:if>
              <td>
                <c:if test="${dtoDownload.isDownloadSortDirectionAsc()}">
                  <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=aminoAcidSubs&sortdir=desc" >
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-213-arrow-down.png" alt="DOWN" height="15" width="15">
                    <spring:message code="snpinsertiondeletion.list.label.aminoAcidSubs"/>
                  </a>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#aminoAcidSubsInfo" target="_blank" data-toggle="tooltip" data-placement="right" title="Amino Acid Substitution Information">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </c:if>
                <c:if test="${dtoDownload.isDownloadSortDirectionDesc()}">
                  <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=aminoAcidSubs&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                    <spring:message code="snpinsertiondeletion.list.label.aminoAcidSubs"/>
                  </a>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#aminoAcidSubsInfo" target="_blank" data-toggle="tooltip" data-placement="right" title="Amino Acid Substitution Information">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </c:if>
              </td>
              <td>
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=predictionCategory&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.predictionCategory"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#predictionCategory" target="_blank" data-toggle="tooltip" data-placement="right" title="Prediction Category">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
              <td>
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=scoreProvean&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.scoreProvean"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#proveanScore" target="_blank" data-toggle="tooltip" data-placement="right" title="PROVEAN Score">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
              <td>
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=scoreSift&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.scoreSift"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#siftScore" target="_blank" data-toggle="tooltip" data-placement="right" title="SIFT Score">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
              <td>
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=scoreConservation&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.scoreConservation"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#siftConsScore" target="_blank" data-toggle="tooltip" data-placement="right" title="SIFT Conservation Score">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
              <td>
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=proteinAlignNumber&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.proteinAlignNumber"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#proteinAlignNum" target="_blank" data-toggle="tooltip" data-placement="right" title="Protein Alignment Number">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
              <td>
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=totalAlignSequenceNumber&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.totalAlignSequenceNumber"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#totNumSeqAligned" target="_blank" data-toggle="tooltip" data-placement="right" title="Total Number of Sequence Aligned">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
            </tr>
          </c:if>
          
          <c:if test="${dtoDownload.isDownloadSortFieldPredictionCategory()}">
            <tr>
              <td>
                <spring:message code="snpinsertiondeletion.list.label.chromosomeId"/>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#chromosomeIdentifier" target="_blank" data-toggle="tooltip" data-placement="right" title="Chromosome Id">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
              <td>
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=position&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.position"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#position" target="_blank" data-toggle="tooltip" data-placement="right" title="Position">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
              <td>
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=reference&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.reference"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#referenceAllele" target="_blank" data-toggle="tooltip" data-placement="right" title="Reference Allele">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
              <td>
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=alternative&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.alternative"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#alternativeAllele" target="_blank" data-toggle="tooltip" data-placement="right" title="Alternative Allele">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
              <c:if test="${dtoDownload.isDownloadReferenceBreedI() || dtoDownload.isDownloadAlternativeBreedI()}">
                <td>
                  <spring:message code="snpinsertiondeletion.list.label.breedIAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed I">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </td>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedJ() || dtoDownload.isDownloadAlternativeBreedJ()}">
                <td>
                  <spring:message code="snpinsertiondeletion.list.label.breedJAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed J">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </td>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedW() || dtoDownload.isDownloadAlternativeBreedW()}">
                <td>
                  <spring:message code="snpinsertiondeletion.list.label.breedWAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed W">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </td>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedN() || dtoDownload.isDownloadAlternativeBreedN()}">
                <td>
                  <spring:message code="snpinsertiondeletion.list.label.breedNAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed N">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </td>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedL() || dtoDownload.isDownloadAlternativeBreedL()}">
                <td>
                  <spring:message code="snpinsertiondeletion.list.label.breedLAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed L">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </td>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedZ() || dtoDownload.isDownloadAlternativeBreedZ()}">
                <td>
                  <spring:message code="snpinsertiondeletion.list.label.breedZAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed Z">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </td>
              </c:if>
              <td>
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=aminoAcidSubs&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.aminoAcidSubs"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#aminoAcidSubsInfo" target="_blank" data-toggle="tooltip" data-placement="right" title="Amino Acid Substitution Information">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
              <td>
                <c:if test="${dtoDownload.isDownloadSortDirectionAsc()}">
                  <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=predictionCategory&sortdir=desc" >
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-213-arrow-down.png" alt="DOWN" height="15" width="15">
                    <spring:message code="snpinsertiondeletion.list.label.predictionCategory"/>
                  </a>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#predictionCategory" target="_blank" data-toggle="tooltip" data-placement="right" title="Prediction Category">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </c:if>
                <c:if test="${dtoDownload.isDownloadSortDirectionDesc()}">
                  <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=predictionCategory&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                    <spring:message code="snpinsertiondeletion.list.label.predictionCategory"/>
                  </a>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#predictionCategory" target="_blank" data-toggle="tooltip" data-placement="right" title="Prediction Category">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </c:if>
              </td>
              <td>
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=scoreProvean&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.scoreProvean"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#proveanScore" target="_blank" data-toggle="tooltip" data-placement="right" title="PROVEAN Score">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
              <td>
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=scoreSift&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.scoreSift"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#siftScore" target="_blank" data-toggle="tooltip" data-placement="right" title="SIFT Score">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
              <td>
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=scoreConservation&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.scoreConservation"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#siftConsScore" target="_blank" data-toggle="tooltip" data-placement="right" title="SIFT Conservation Score">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
              <td>
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=proteinAlignNumber&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.proteinAlignNumber"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#proteinAlignNum" target="_blank" data-toggle="tooltip" data-placement="right" title="Protein Alignment Number">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
              <td>
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=totalAlignSequenceNumber&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.totalAlignSequenceNumber"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#totNumSeqAligned" target="_blank" data-toggle="tooltip" data-placement="right" title="Total Number of Sequence Aligned">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
            </tr>
          </c:if>
          
          <c:if test="${dtoDownload.isDownloadSortFieldScoreSift()}">
            <tr>
              <td>
                <spring:message code="snpinsertiondeletion.list.label.chromosomeId"/>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#chromosomeIdentifier" target="_blank" data-toggle="tooltip" data-placement="right" title="Chromosome Id">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
              <td>
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=position&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.position"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#position" target="_blank" data-toggle="tooltip" data-placement="right" title="Position">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
              <td>
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=reference&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.reference"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#referenceAllele" target="_blank" data-toggle="tooltip" data-placement="right" title="Reference Allele">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
              <td>
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=alternative&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.alternative"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#alternativeAllele" target="_blank" data-toggle="tooltip" data-placement="right" title="Alternative Allele">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
              <c:if test="${dtoDownload.isDownloadReferenceBreedI() || dtoDownload.isDownloadAlternativeBreedI()}">
                <td>
                  <spring:message code="snpinsertiondeletion.list.label.breedIAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed I">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </td>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedJ() || dtoDownload.isDownloadAlternativeBreedJ()}">
                <td>
                  <spring:message code="snpinsertiondeletion.list.label.breedJAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed J">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </td>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedW() || dtoDownload.isDownloadAlternativeBreedW()}">
                <td>
                  <spring:message code="snpinsertiondeletion.list.label.breedWAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed W">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </td>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedN() || dtoDownload.isDownloadAlternativeBreedN()}">
                <td>
                  <spring:message code="snpinsertiondeletion.list.label.breedNAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed N">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </td>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedL() || dtoDownload.isDownloadAlternativeBreedL()}">
                <td>
                  <spring:message code="snpinsertiondeletion.list.label.breedLAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed L">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </td>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedZ() || dtoDownload.isDownloadAlternativeBreedZ()}">
                <td>
                  <spring:message code="snpinsertiondeletion.list.label.breedZAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed Z">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </td>
              </c:if>
              <td>
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=aminoAcidSubs&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.aminoAcidSubs"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#aminoAcidSubsInfo" target="_blank" data-toggle="tooltip" data-placement="right" title="Amino Acid Substitution Information">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
              <td>
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=predictionCategory&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.predictionCategory"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#predictionCategory" target="_blank" data-toggle="tooltip" data-placement="right" title="Prediction Category">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
              <td>
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=scoreProvean&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.scoreProvean"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#proveanScore" target="_blank" data-toggle="tooltip" data-placement="right" title="PROVEAN Score">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
              <td>
                <c:if test="${dtoDownload.isDownloadSortDirectionAsc()}">
                  <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=scoreSift&sortdir=desc" >
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-213-arrow-down.png" alt="DOWN" height="15" width="15">
                    <spring:message code="snpinsertiondeletion.list.label.scoreSift"/>
                    <br />
                  </a>
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#siftScore" target="_blank" data-toggle="tooltip" data-placement="right" title="SIFT Score">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </c:if>
                <c:if test="${dtoDownload.isDownloadSortDirectionDesc()}">
                  <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=scoreSift&sortdir=asc" >
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                    <spring:message code="snpinsertiondeletion.list.label.scoreSift"/>
                  </a>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#siftScore" target="_blank" data-toggle="tooltip" data-placement="right" title="SIFT Score">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </c:if>
              </td>
              <td>
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=scoreConservation&sortdir=asc" >
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.scoreConservation"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#siftConsScore" target="_blank" data-toggle="tooltip" data-placement="right" title="SIFT Conservation Score">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
              <td>
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=proteinAlignNumber&sortdir=asc" >
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.proteinAlignNumber"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#proteinAlignNum" target="_blank" data-toggle="tooltip" data-placement="right" title="Protein Alignment Number">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
              <td>
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=totalAlignSequenceNumber&sortdir=asc" >
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.totalAlignSequenceNumber"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#totNumSeqAligned" target="_blank" data-toggle="tooltip" data-placement="right" title="Total Number of Sequence Aligned">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
            </tr>
          </c:if>
          
          <c:if test="${dtoDownload.isDownloadSortFieldScoreConservation()}">
            <tr>
              <td>
                <spring:message code="snpinsertiondeletion.list.label.chromosomeId"/>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#chromosomeIdentifier" target="_blank" data-toggle="tooltip" data-placement="right" title="Chromosome Id">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
              <td>
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=position&sortdir=asc" >
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.position"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#position" target="_blank" data-toggle="tooltip" data-placement="right" title="Position">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
              <td>
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=reference&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.reference"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#referenceAllele" target="_blank" data-toggle="tooltip" data-placement="right" title="Reference Allele">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
              <td>
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=alternative&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.alternative"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#alternativeAllele" target="_blank" data-toggle="tooltip" data-placement="right" title="Alternative Allele">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
              <c:if test="${dtoDownload.isDownloadReferenceBreedI() || dtoDownload.isDownloadAlternativeBreedI()}">
                <td>
                  <spring:message code="snpinsertiondeletion.list.label.breedIAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed I">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </td>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedJ() || dtoDownload.isDownloadAlternativeBreedJ()}">
                <td>
                  <spring:message code="snpinsertiondeletion.list.label.breedJAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed J">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </td>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedW() || dtoDownload.isDownloadAlternativeBreedW()}">
                <td>
                  <spring:message code="snpinsertiondeletion.list.label.breedWAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed W">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </td>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedN() || dtoDownload.isDownloadAlternativeBreedN()}">
                <td>
                  <spring:message code="snpinsertiondeletion.list.label.breedNAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed N">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </td>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedL() || dtoDownload.isDownloadAlternativeBreedL()}">
                <td>
                  <spring:message code="snpinsertiondeletion.list.label.breedLAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed L">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </td>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedZ() || dtoDownload.isDownloadAlternativeBreedZ()}">
                <td>
                  <spring:message code="snpinsertiondeletion.list.label.breedZAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed Z">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </td>
              </c:if>
              <td>
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=aminoAcidSubs&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.aminoAcidSubs"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#aminoAcidSubsInfo" target="_blank" data-toggle="tooltip" data-placement="right" title="Amino Acid Substitution Information">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
              <td>
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=predictionCategory&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.predictionCategory"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#predictionCategory" target="_blank" data-toggle="tooltip" data-placement="right" title="Prediction Category">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
              <td>
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=scoreProvean&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.scoreProvean"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#proveanScore" target="_blank" data-toggle="tooltip" data-placement="right" title="PROVEAN Score">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
              <td>
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=scoreSift&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.scoreSift"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#siftScore" target="_blank" data-toggle="tooltip" data-placement="right" title="SIFT Score">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
              <td>
                <c:if test="${dtoDownload.isDownloadSortDirectionAsc()}">
                  <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=scoreConservation&sortdir=desc" >
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-213-arrow-down.png" alt="DOWN" height="15" width="15">
                    <spring:message code="snpinsertiondeletion.list.label.scoreConservation"/>
                  </a>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#siftConsScore" target="_blank" data-toggle="tooltip" data-placement="right" title="SIFT Conservation Score">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </c:if>
                <c:if test="${dtoDownload.isDownloadSortDirectionDesc()}">
                  <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=scoreConservation&sortdir=asc" >
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                    <spring:message code="snpinsertiondeletion.list.label.scoreConservation"/>
                  </a>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#siftConsScore" target="_blank" data-toggle="tooltip" data-placement="right" title="SIFT Conservation Score">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </c:if>
              </td>
              <td>
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=proteinAlignNumber&sortdir=asc" >
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.proteinAlignNumber"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#proteinAlignNum" target="_blank" data-toggle="tooltip" data-placement="right" title="Protein Alignment Number">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
              <td>
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=totalAlignSequenceNumber&sortdir=asc" >
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.totalAlignSequenceNumber"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#totNumSeqAligned" target="_blank" data-toggle="tooltip" data-placement="right" title="Total Number of Sequence Aligned">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
            </tr>
          </c:if>
          
          <c:if test="${dtoDownload.isDownloadSortFieldProteinAlignNumber()}">
            <tr>
              <td>
                <spring:message code="snpinsertiondeletion.list.label.chromosomeId"/>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#chromosomeIdentifier" target="_blank" data-toggle="tooltip" data-placement="right" title="Chromosome Id">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
              <td>
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=position&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.position"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#position" target="_blank" data-toggle="tooltip" data-placement="right" title="Position">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
              <td>
                <c:if test="${dtoDownload.isDownloadSortDirectionAsc()}">
                  <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=reference&sortdir=desc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                    <spring:message code="snpinsertiondeletion.list.label.reference"/>
                  </a>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#referenceAllele" target="_blank" data-toggle="tooltip" data-placement="right" title="Reference Allele">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </c:if>
                <c:if test="${dtoDownload.isDownloadSortDirectionDesc()}">
                  <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=reference&sortdir=asc" >
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                    <spring:message code="snpinsertiondeletion.list.label.reference"/>
                  </a>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#referenceAllele" target="_blank" data-toggle="tooltip" data-placement="right" title="Reference Allele">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </c:if>
              </td>
              <td>
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=alternative&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.alternative"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#alternativeAllele" target="_blank" data-toggle="tooltip" data-placement="right" title="Alternative Allele">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
              <c:if test="${dtoDownload.isDownloadReferenceBreedI() || dtoDownload.isDownloadAlternativeBreedI()}">
                <td>
                  <spring:message code="snpinsertiondeletion.list.label.breedIAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed I">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </td>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedJ() || dtoDownload.isDownloadAlternativeBreedJ()}">
                <td>
                  <spring:message code="snpinsertiondeletion.list.label.breedJAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed J">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </td>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedW() || dtoDownload.isDownloadAlternativeBreedW()}">
                <td>
                  <spring:message code="snpinsertiondeletion.list.label.breedWAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed W">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </td>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedN() || dtoDownload.isDownloadAlternativeBreedN()}">
                <td>
                  <spring:message code="snpinsertiondeletion.list.label.breedNAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed N">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </td>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedL() || dtoDownload.isDownloadAlternativeBreedL()}">
                <td>
                  <spring:message code="snpinsertiondeletion.list.label.breedLAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed L">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </td>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedZ() || dtoDownload.isDownloadAlternativeBreedZ()}">
                <td>
                  <spring:message code="snpinsertiondeletion.list.label.breedZAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed Z">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </td>
              </c:if>
              <td>
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=aminoAcidSubs&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.aminoAcidSubs"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#aminoAcidSubsInfo" target="_blank" data-toggle="tooltip" data-placement="right" title="Amino Acid Substitution Information">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
              <td>
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=predictionCategory&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.predictionCategory"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#predictionCategory" target="_blank" data-toggle="tooltip" data-placement="right" title="Prediction Category">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
              <td>
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=scoreProvean&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.scoreProvean"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#proveanScore" target="_blank" data-toggle="tooltip" data-placement="right" title="PROVEAN Score">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
              <td>
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=scoreSift&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.scoreSift"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#siftScore" target="_blank" data-toggle="tooltip" data-placement="right" title="SIFT Score">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
              <td>
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=scoreConservation&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.scoreConservation"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#siftConsScore" target="_blank" data-toggle="tooltip" data-placement="right" title="SIFT Conservation Score">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
              <td>
                <c:if test="${dtoDownload.isDownloadSortDirectionAsc()}">
                  <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=proteinAlignNumber&sortdir=desc" >
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-213-arrow-down.png" alt="DOWN" height="15" width="15">
                    <spring:message code="snpinsertiondeletion.list.label.proteinAlignNumber"/>
                  </a>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#proteinAlignNum" target="_blank" data-toggle="tooltip" data-placement="right" title="Protein Alignment Number">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </c:if>
                <c:if test="${dtoDownload.isDownloadSortDirectionDesc()}">
                  <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=proteinAlignNumber&sortdir=asc" >
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                    <spring:message code="snpinsertiondeletion.list.label.proteinAlignNumber"/>
                  </a>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#proteinAlignNum" target="_blank" data-toggle="tooltip" data-placement="right" title="Protein Alignment Number">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </c:if>
              </td>
              <td>
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=totalAlignSequenceNumber&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.totalAlignSequenceNumber"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#totNumSeqAligned" target="_blank" data-toggle="tooltip" data-placement="right" title="Total Number of Sequence Aligned">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
            </tr>
          </c:if>
          
          <c:if test="${dtoDownload.isDownloadSortFieldTotalAlignSequenceNumber()}">
            <tr>
              <td>
                <spring:message code="snpinsertiondeletion.list.label.chromosomeId"/>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#chromosomeIdentifier" target="_blank" data-toggle="tooltip" data-placement="right" title="Chromosome Id">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
              <td>
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=position&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.position"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#position" target="_blank" data-toggle="tooltip" data-placement="right" title="Position">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
              <td>
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=reference&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.reference"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#referenceAllele" target="_blank" data-toggle="tooltip" data-placement="right" title="Reference Allele">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
              <td>
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=alternative&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.alternative"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#alternativeAllele" target="_blank" data-toggle="tooltip" data-placement="right" title="Alternative Allele">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
              <c:if test="${dtoDownload.isDownloadReferenceBreedI() || dtoDownload.isDownloadAlternativeBreedI()}">
                <td>
                  <spring:message code="snpinsertiondeletion.list.label.breedIAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed I">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </td>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedJ() || dtoDownload.isDownloadAlternativeBreedJ()}">
                <td>
                  <spring:message code="snpinsertiondeletion.list.label.breedJAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed J">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </td>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedW() || dtoDownload.isDownloadAlternativeBreedW()}">
                <td>
                  <spring:message code="snpinsertiondeletion.list.label.breedWAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed W">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </td>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedN() || dtoDownload.isDownloadAlternativeBreedN()}">
                <td>
                  <spring:message code="snpinsertiondeletion.list.label.breedNAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed N">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </td>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedL() || dtoDownload.isDownloadAlternativeBreedL()}">
                <td>
                  <spring:message code="snpinsertiondeletion.list.label.breedLAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed L">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </td>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedZ() || dtoDownload.isDownloadAlternativeBreedZ()}">
                <td>
                  <spring:message code="snpinsertiondeletion.list.label.breedZAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed Z">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </td>
              </c:if>
              <td>
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=aminoAcidSubs&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.aminoAcidSubs"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#aminoAcidSubsInfo" target="_blank" data-toggle="tooltip" data-placement="right" title="Amino Acid Substitution Information">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
              <td>
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=predictionCategory&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.predictionCategory"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#predictionCategory" target="_blank" data-toggle="tooltip" data-placement="right" title="Prediction Category">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
              <td>
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=scoreProvean&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.scoreProvean"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#proveanScore" target="_blank" data-toggle="tooltip" data-placement="right" title="PROVEAN Score">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
              <td>
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=scoreSift&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.scoreSift"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#siftScore" target="_blank" data-toggle="tooltip" data-placement="right" title="SIFT Score">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
              <td>
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=scoreConservation&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.scoreConservation"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#siftConsScore" target="_blank" data-toggle="tooltip" data-placement="right" title="SIFT Conservation Score">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
              <td>
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=proteinAlignNumber&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.proteinAlignNumber"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#proteinAlignNum" target="_blank" data-toggle="tooltip" data-placement="right" title="Protein Alignment Number">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
              <td>
                <c:if test="${dtoDownload.isDownloadSortDirectionAsc()}">
                  <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=totalAlignSequenceNumber&sortdir=desc" >
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-213-arrow-down.png" alt="DOWN" height="15" width="15">
                    <spring:message code="snpinsertiondeletion.list.label.totalAlignSequenceNumber"/>
                  </a>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#totNumSeqAligned" target="_blank" data-toggle="tooltip" data-placement="right" title="Total Number of Sequence Aligned">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </c:if>
                <c:if test="${dtoDownload.isDownloadSortDirectionDesc()}">
                  <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=totalAlignSequenceNumber&sortdir=asc" >
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                    <spring:message code="snpinsertiondeletion.list.label.totalAlignSequenceNumber"/>
                  </a>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#totNumSeqAligned" target="_blank" data-toggle="tooltip" data-placement="right" title="Total Number of Sequence Aligned">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </c:if>
              </td>
            </tr>
          </c:if>
          
          <c:if test="${dtoDownload.isDownloadSortFieldScoreProvean()}">
            <tr>
              <td>
                <spring:message code="snpinsertiondeletion.list.label.chromosomeId"/>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#chromosomeIdentifier" target="_blank" data-toggle="tooltip" data-placement="right" title="Chromosome Id">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
              <td>
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=position&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.position"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#position" target="_blank" data-toggle="tooltip" data-placement="right" title="Position">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
              <td>
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=reference&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.reference"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#referenceAllele" target="_blank" data-toggle="tooltip" data-placement="right" title="Reference Allele">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
              <td>
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=alternative&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.alternative"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#alternativeAllele" target="_blank" data-toggle="tooltip" data-placement="right" title="Alternative Allele">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
              <c:if test="${dtoDownload.isDownloadReferenceBreedI() || dtoDownload.isDownloadAlternativeBreedI()}">
                <td>
                  <spring:message code="snpinsertiondeletion.list.label.breedIAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed I">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </td>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedJ() || dtoDownload.isDownloadAlternativeBreedJ()}">
                <td>
                  <spring:message code="snpinsertiondeletion.list.label.breedJAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed J">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </td>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedW() || dtoDownload.isDownloadAlternativeBreedW()}">
                <td>
                  <spring:message code="snpinsertiondeletion.list.label.breedWAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed W">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </td>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedN() || dtoDownload.isDownloadAlternativeBreedN()}">
                <td>
                  <spring:message code="snpinsertiondeletion.list.label.breedNAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed N">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </td>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedL() || dtoDownload.isDownloadAlternativeBreedL()}">
                <td>
                  <spring:message code="snpinsertiondeletion.list.label.breedLAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed L">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </td>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedZ() || dtoDownload.isDownloadAlternativeBreedZ()}">
                <td>
                  <spring:message code="snpinsertiondeletion.list.label.breedZAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed Z">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </td>
              </c:if>
              <td>
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=aminoAcidSubs&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.aminoAcidSubs"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#aminoAcidSubsInfo" target="_blank" data-toggle="tooltip" data-placement="right" title="Amino Acid Substitution Information">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
              <td>
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=predictionCategory&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.predictionCategory"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#predictionCategory" target="_blank" data-toggle="tooltip" data-placement="right" title="Prediction Category">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
              <td>
                <c:if test="${dtoDownload.isDownloadSortDirectionAsc()}">
                  <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=scoreProvean&sortdir=desc" >
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-213-arrow-down.png" alt="DOWN" height="15" width="15">
                    <spring:message code="snpinsertiondeletion.list.label.scoreProvean"/>
                  </a>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#proveanScore" target="_blank" data-toggle="tooltip" data-placement="right" title="PROVEAN Score">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </c:if>
                <c:if test="${dtoDownload.isDownloadSortDirectionDesc()}">
                  <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=scoreProvean&sortdir=asc" >
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                    <spring:message code="snpinsertiondeletion.list.label.scoreProvean"/>
                  </a>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#proveanScore" target="_blank" data-toggle="tooltip" data-placement="right" title="PROVEAN Score">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </c:if>
              </td>
              <td>
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=scoreSift&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.scoreSift"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#siftScore" target="_blank" data-toggle="tooltip" data-placement="right" title="SIFT Score">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
              <td>
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=scoreConservation&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.scoreConservation"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#siftConsScore" target="_blank" data-toggle="tooltip" data-placement="right" title="SIFT Conservation Score">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
              <td>
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=proteinAlignNumber&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.proteinAlignNumber"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#proteinAlignNum" target="_blank" data-toggle="tooltip" data-placement="right" title="Protein Alignment Number">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
              <td>
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=totalAlignSequenceNumber&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.totalAlignSequenceNumber"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#totNumSeqAligned" target="_blank" data-toggle="tooltip" data-placement="right" title="Total Number of Sequence Aligned">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </td>
            </tr>
          </c:if>
        </thead>
        
        <tbody>
          <c:forEach items="${SNPInsertionDeletion}" var="snpinsertiondeletion" varStatus="rowStatus">
            <tr>
              <td>
                <c:out value="${snpinsertiondeletion.chromosomeId}"/>
              </td>
              <td>
                <c:out value="${snpinsertiondeletion.position}"/>
              </td>
              <td>
                <c:out value="${snpinsertiondeletion.reference}"/>
              </td>
              <td>
                <c:out value="${snpinsertiondeletion.alternative}"/>
              </td>
              <c:if test="${dtoDownload.isDownloadReferenceBreedI() || dtoDownload.isDownloadAlternativeBreedI()}">
                <td>
                  <c:out value="${snpinsertiondeletion.getBreedAllelesI()}"/>
                </td>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedJ() || dtoDownload.isDownloadAlternativeBreedJ()}">
                <td>
                  <c:out value="${snpinsertiondeletion.getBreedAllelesJ()}"/>
                </td>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedW() || dtoDownload.isDownloadAlternativeBreedW()}">
                <td>
                  <c:out value="${snpinsertiondeletion.getBreedAllelesW()}"/>
                </td>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedN() || dtoDownload.isDownloadAlternativeBreedN()}">
                <td>
                  <c:out value="${snpinsertiondeletion.getBreedAllelesN()}"/>
                </td>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedL() || dtoDownload.isDownloadAlternativeBreedL()}">
                <td>
                  <c:out value="${snpinsertiondeletion.getBreedAllelesL()}"/>
                </td>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedZ() || dtoDownload.isDownloadAlternativeBreedZ()}">
                <td>
                  <c:out value="${snpinsertiondeletion.getBreedAllelesZ()}"/>
                </td>
              </c:if>
              <td>
                <c:out value="${snpinsertiondeletion.getAminoAcidSubs()}"/>
              </td>
              <td>
                <c:out value="${snpinsertiondeletion.getPredictionCategory()}"/>
              </td>
              <td>
                <c:out value="${snpinsertiondeletion.getScoreProvean()}"/>
              </td>
              <td>
                <c:out value="${snpinsertiondeletion.getScoreSift()}"/>
              </td>
              <td>
                <c:out value="${snpinsertiondeletion.getScoreConservation()}"/>
              </td>
              <td>
                <c:out value="${snpinsertiondeletion.getProteinAlignNumber()}"/>
              </td>
              <td>
                <c:out value="${snpinsertiondeletion.getTotalAlignSequenceNumber()}"/>
              </td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </div>
    <!-- close span12 -->
  </div>
  <!-- close row spacer -->
</c:if>
