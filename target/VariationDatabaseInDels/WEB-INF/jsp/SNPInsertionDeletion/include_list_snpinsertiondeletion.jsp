<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<c:if test="${SNPInsertionDeletion != null && totalPages != 0}">
  <div class="row spacer">
    <div class="span12">
      <table class="indels">
        <thead>

          <c:if test="${dtoDownload.isDownloadSortFieldPositionStart() || dtoDownload.isDownloadSortFieldNone()}">
            <tr>
              <th class="row-1 row-col-1">
                <spring:message code="snpinsertiondeletion.list.label.chromosomeId"/>                
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#chromosomeIdentifier" target="_blank" data-toggle="tooltip" data-placement="right" title="Chromosome Id">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </th>
              <th class="row-2 row-col-2">
                <c:if test="${dtoDownload.isDownloadSortDirectionAsc()}">
                  <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=positionStart&sortdir=desc" >
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-213-arrow-down.png" alt="DOWN" height="15" width="15">
                    <spring:message code="snpinsertiondeletion.list.label.positionstart"/>
                  </a>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#positionStart" target="_blank" data-toggle="tooltip" data-placement="right" title="Position Start">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </c:if>
                <c:if test="${dtoDownload.isDownloadSortDirectionDesc()}">
                  <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=positionStart&sortdir=asc" >
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                    <spring:message code="snpinsertiondeletion.list.label.positionstart"/>
                  </a>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#positionStart" target="_blank" data-toggle="tooltip" data-placement="right" title="Position Start">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </c:if>
              </th>
              <th class="row-3 row-col-3">
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=positionEnd&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.positionend"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#positionEnd" target="_blank" data-toggle="tooltip" data-placement="right" title="Position End">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </th>
              <th class="row-4 row-col-4">
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=reference&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.reference"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#referenceAllele" target="_blank" data-toggle="tooltip" data-placement="right" title="Reference Allele">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </th>
              <th class="row-5 row-col-5">
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=alternative&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.alternative"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#alternativeAllele" target="_blank" data-toggle="tooltip" data-placement="right" title="Alternative Allele">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </th>
              
              <c:if test="${dtoDownload.isDownloadReferenceBreedI()}">
                <th class="row-6 row-col-6">
                  <spring:message code="snpinsertiondeletion.list.label.breedIAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed I">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedJ()}">
                <th class="row-6 row-col-6">
                  <spring:message code="snpinsertiondeletion.list.label.breedJAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed J">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedW()}">
                <th class="row-6 row-col-6">
                  <spring:message code="snpinsertiondeletion.list.label.breedWAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed W">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedN()}">
                <th class="row-6 row-col-6">
                  <spring:message code="snpinsertiondeletion.list.label.breedNAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed N">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedL()}">
                <th class="row-6 row-col-6">
                  <spring:message code="snpinsertiondeletion.list.label.breedLAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed L">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedZ()}">
                <th class="row-6 row-col-6">
                  <spring:message code="snpinsertiondeletion.list.label.breedZAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed Z">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>

              <c:if test="${dtoDownload.isDownloadAlternativeBreedI()}">
                <th class="row-7 row-col-7">
                  <spring:message code="snpinsertiondeletion.list.label.breedIAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed I">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadAlternativeBreedJ()}">
                <th class="row-7 row-col-7">
                  <spring:message code="snpinsertiondeletion.list.label.breedJAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed J">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadAlternativeBreedW()}">
                <th class="row-7 row-col-7">
                  <spring:message code="snpinsertiondeletion.list.label.breedWAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed W">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadAlternativeBreedN()}">
                <th class="row-7 row-col-7">
                  <spring:message code="snpinsertiondeletion.list.label.breedNAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed N">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadAlternativeBreedL()}">
                <th class="row-7 row-col-7">
                  <spring:message code="snpinsertiondeletion.list.label.breedLAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed L">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadAlternativeBreedZ()}">
                <th class="row-7 row-col-7">
                  <spring:message code="snpinsertiondeletion.list.label.breedZAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed Z">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              
            </tr>
          </c:if>
          
          <c:if test="${dtoDownload.isDownloadSortFieldPositionEnd()}">
            <tr>
              <th class="row-1 row-col-1">
                <spring:message code="snpinsertiondeletion.list.label.chromosomeId"/>                
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#chromosomeIdentifier" target="_blank" data-toggle="tooltip" data-placement="right" title="Chromosome Id">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </th>
              <th class="row-2 row-col-2">
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=positionStart&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.positionstart"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#positionStart" target="_blank" data-toggle="tooltip" data-placement="right" title="Position Start">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </th>
              <th class="row-3 row-col-3">
                <c:if test="${dtoDownload.isDownloadSortDirectionAsc()}">
                  <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=positionEnd&sortdir=desc" >
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-213-arrow-down.png" alt="DOWN" height="15" width="15">
                    <spring:message code="snpinsertiondeletion.list.label.positionend"/>
                  </a>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#positionStart" target="_blank" data-toggle="tooltip" data-placement="right" title="Position End">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </c:if>
                <c:if test="${dtoDownload.isDownloadSortDirectionDesc()}">
                  <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=positionEnd&sortdir=asc" >
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                    <spring:message code="snpinsertiondeletion.list.label.positionend"/>
                  </a>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#positionStart" target="_blank" data-toggle="tooltip" data-placement="right" title="Position End">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </c:if>
              </th>
              <th class="row-4 row-col-4">
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=reference&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.reference"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#referenceAllele" target="_blank" data-toggle="tooltip" data-placement="right" title="Reference Allele">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </th>
              <th class="row-5 row-col-5">
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=alternative&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.alternative"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#alternativeAllele" target="_blank" data-toggle="tooltip" data-placement="right" title="Alternative Allele">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </th>
              
              <c:if test="${dtoDownload.isDownloadReferenceBreedI()}">
                <th class="row-6 row-col-6">
                  <spring:message code="snpinsertiondeletion.list.label.breedIAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed I">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedJ()}">
                <th class="row-6 row-col-6">
                  <spring:message code="snpinsertiondeletion.list.label.breedJAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed J">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedW()}">
                <th class="row-6 row-col-6">
                  <spring:message code="snpinsertiondeletion.list.label.breedWAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed W">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedN()}">
                <th class="row-6 row-col-6">
                  <spring:message code="snpinsertiondeletion.list.label.breedNAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed N">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedL()}">
                <th class="row-6 row-col-6">
                  <spring:message code="snpinsertiondeletion.list.label.breedLAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed L">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedZ()}">
                <th class="row-6 row-col-6">
                  <spring:message code="snpinsertiondeletion.list.label.breedZAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed Z">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>

              <c:if test="${dtoDownload.isDownloadAlternativeBreedI()}">
                <th class="row-7 row-col-7">
                  <spring:message code="snpinsertiondeletion.list.label.breedIAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed I">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadAlternativeBreedJ()}">
                <th class="row-7 row-col-7">
                  <spring:message code="snpinsertiondeletion.list.label.breedJAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed J">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadAlternativeBreedW()}">
                <th class="row-7 row-col-7">
                  <spring:message code="snpinsertiondeletion.list.label.breedWAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed W">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadAlternativeBreedN()}">
                <th class="row-7 row-col-7">
                  <spring:message code="snpinsertiondeletion.list.label.breedNAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed N">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadAlternativeBreedL()}">
                <th class="row-7 row-col-7">
                  <spring:message code="snpinsertiondeletion.list.label.breedLAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed L">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadAlternativeBreedZ()}">
                <th class="row-7 row-col-7">
                  <spring:message code="snpinsertiondeletion.list.label.breedZAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed Z">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              
            </tr>
          </c:if>
          
          <c:if test="${dtoDownload.isDownloadSortFieldReference()}">
            <tr>
              <th class="row-1 row-col-1">
                <spring:message code="snpinsertiondeletion.list.label.chromosomeId"/>                
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#chromosomeIdentifier" target="_blank" data-toggle="tooltip" data-placement="right" title="Chromosome Id">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </th>
              <th class="row-2 row-col-2">
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=positionStart&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.positionstart"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#positionStart" target="_blank" data-toggle="tooltip" data-placement="right" title="Position Start">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </th>
              <th class="row-3 row-col-3">
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=positionEnd&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.positionend"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#positionEnd" target="_blank" data-toggle="tooltip" data-placement="right" title="Position End">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </th>
              <th class="row-4 row-col-4">
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
              </th>
              <th class="row-5 row-col-5">
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=alternative&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.alternative"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#alternativeAllele" target="_blank" data-toggle="tooltip" data-placement="right" title="Alternative Allele">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </th>
              
              <c:if test="${dtoDownload.isDownloadReferenceBreedI()}">
                <th class="row-6 row-col-6">
                  <spring:message code="snpinsertiondeletion.list.label.breedIAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed I">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedJ()}">
                <th class="row-6 row-col-6">
                  <spring:message code="snpinsertiondeletion.list.label.breedJAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed J">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedW()}">
                <th class="row-6 row-col-6">
                  <spring:message code="snpinsertiondeletion.list.label.breedWAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed W">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedN()}">
                <th class="row-6 row-col-6">
                  <spring:message code="snpinsertiondeletion.list.label.breedNAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed N">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedL()}">
                <th class="row-6 row-col-6">
                  <spring:message code="snpinsertiondeletion.list.label.breedLAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed L">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedZ()}">
                <th class="row-6 row-col-6">
                  <spring:message code="snpinsertiondeletion.list.label.breedZAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed Z">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>

              <c:if test="${dtoDownload.isDownloadAlternativeBreedI()}">
                <th class="row-7 row-col-7">
                  <spring:message code="snpinsertiondeletion.list.label.breedIAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed I">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadAlternativeBreedJ()}">
                <th class="row-7 row-col-7">
                  <spring:message code="snpinsertiondeletion.list.label.breedJAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed J">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadAlternativeBreedW()}">
                <th class="row-7 row-col-7">
                  <spring:message code="snpinsertiondeletion.list.label.breedWAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed W">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadAlternativeBreedN()}">
                <th class="row-7 row-col-7">
                  <spring:message code="snpinsertiondeletion.list.label.breedNAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed N">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadAlternativeBreedL()}">
                <th class="row-7 row-col-7">
                  <spring:message code="snpinsertiondeletion.list.label.breedLAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed L">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadAlternativeBreedZ()}">
                <th class="row-7 row-col-7">
                  <spring:message code="snpinsertiondeletion.list.label.breedZAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed Z">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              
            </tr>
          </c:if>
          
          <c:if test="${dtoDownload.isDownloadSortFieldAlternative()}">
            <tr>
              <th class="row-1 row-col-1">
                <spring:message code="snpinsertiondeletion.list.label.chromosomeId"/>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#chromosomeIdentifier" target="_blank" data-toggle="tooltip" data-placement="right" title="Chromosome Id">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </th>
              <th class="row-2 row-col-2">
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=positionStart&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.positionstart"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#positionStart" target="_blank" data-toggle="tooltip" data-placement="right" title="Position Start">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </th>
              <th class="row-3 row-col-3">
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=positionEnd&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.positionend"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#positionEnd" target="_blank" data-toggle="tooltip" data-placement="right" title="Position End">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </th>
              <th class="row-4 row-col-4">
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=reference&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.reference"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#referenceAllele" target="_blank" data-toggle="tooltip" data-placement="right" title="Reference Allele">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </th>
              <th class="row-5 row-col-5">
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
              </th>
              
              <c:if test="${dtoDownload.isDownloadReferenceBreedI()}">
                <th class="row-6 row-col-6">
                  <spring:message code="snpinsertiondeletion.list.label.breedIAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed I">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedJ()}">
                <th class="row-6 row-col-6">
                  <spring:message code="snpinsertiondeletion.list.label.breedJAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed J">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedW()}">
                <th class="row-6 row-col-6">
                  <spring:message code="snpinsertiondeletion.list.label.breedWAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed W">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedN()}">
                <th class="row-6 row-col-6">
                  <spring:message code="snpinsertiondeletion.list.label.breedNAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed N">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedL()}">
                <th class="row-6 row-col-6">
                  <spring:message code="snpinsertiondeletion.list.label.breedLAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed L">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedZ()}">
                <th class="row-6 row-col-6">
                  <spring:message code="snpinsertiondeletion.list.label.breedZAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed Z">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>

              <c:if test="${dtoDownload.isDownloadAlternativeBreedI()}">
                <th class="row-7 row-col-7">
                  <spring:message code="snpinsertiondeletion.list.label.breedIAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed I">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadAlternativeBreedJ()}">
                <th class="row-7 row-col-7">
                  <spring:message code="snpinsertiondeletion.list.label.breedJAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed J">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadAlternativeBreedW()}">
                <th class="row-7 row-col-7">
                  <spring:message code="snpinsertiondeletion.list.label.breedWAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed W">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadAlternativeBreedN()}">
                <th class="row-7 row-col-7">
                  <spring:message code="snpinsertiondeletion.list.label.breedNAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed N">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadAlternativeBreedL()}">
                <th class="row-7 row-col-7">
                  <spring:message code="snpinsertiondeletion.list.label.breedLAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed L">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadAlternativeBreedZ()}">
                <th class="row-7 row-col-7">
                  <spring:message code="snpinsertiondeletion.list.label.breedZAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed Z">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              
            </tr>
          </c:if>
          
          
          <c:if test="${dtoDownload.isDownloadSortFieldAminoAcidSubs()}">
            <tr>
              <th class="row-1 row-col-1">
                <spring:message code="snpinsertiondeletion.list.label.chromosomeId"/>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#chromosomeIdentifier" target="_blank" data-toggle="tooltip" data-placement="right" title="Chromosome Id">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </th>
              <th class="row-2 row-col-2">
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=positionStart&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.positionstart"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#positionStart" target="_blank" data-toggle="tooltip" data-placement="right" title="Position Start">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </th>
              <th class="row-3 row-col-3">
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=positionEnd&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.positionend"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#positionEnd" target="_blank" data-toggle="tooltip" data-placement="right" title="Position End">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </th>
              <th class="row-4 row-col-4">
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=reference&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.reference"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#referenceAllele" target="_blank" data-toggle="tooltip" data-placement="right" title="Reference Allele">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </th>
              <th class="row-5 row-col-5">
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=alternative&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.alternative"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#alternativeAllele" target="_blank" data-toggle="tooltip" data-placement="right" title="Alternative Allele">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </th>
              
              <c:if test="${dtoDownload.isDownloadReferenceBreedI()}">
                <th class="row-6 row-col-6">
                  <spring:message code="snpinsertiondeletion.list.label.breedIAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed I">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedJ()}">
                <th class="row-6 row-col-6">
                  <spring:message code="snpinsertiondeletion.list.label.breedJAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed J">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedW()}">
                <th class="row-6 row-col-6">
                  <spring:message code="snpinsertiondeletion.list.label.breedWAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed W">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedN()}">
                <th class="row-6 row-col-6">
                  <spring:message code="snpinsertiondeletion.list.label.breedNAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed N">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedL()}">
                <th class="row-6 row-col-6">
                  <spring:message code="snpinsertiondeletion.list.label.breedLAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed L">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedZ()}">
                <th class="row-6 row-col-6">
                  <spring:message code="snpinsertiondeletion.list.label.breedZAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed Z">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>

              <c:if test="${dtoDownload.isDownloadAlternativeBreedI()}">
                <th class="row-7 row-col-7">
                  <spring:message code="snpinsertiondeletion.list.label.breedIAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed I">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadAlternativeBreedJ()}">
                <th class="row-7 row-col-7">
                  <spring:message code="snpinsertiondeletion.list.label.breedJAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed J">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadAlternativeBreedW()}">
                <th class="row-7 row-col-7">
                  <spring:message code="snpinsertiondeletion.list.label.breedWAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed W">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadAlternativeBreedN()}">
                <th class="row-7 row-col-7">
                  <spring:message code="snpinsertiondeletion.list.label.breedNAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed N">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadAlternativeBreedL()}">
                <th class="row-7 row-col-7">
                  <spring:message code="snpinsertiondeletion.list.label.breedLAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed L">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadAlternativeBreedZ()}">
                <th class="row-7 row-col-7">
                  <spring:message code="snpinsertiondeletion.list.label.breedZAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed Z">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              
            </tr>
          </c:if>
          
          <c:if test="${dtoDownload.isDownloadSortFieldPredictionCategory()}">
            <tr>
              <th class="row-1 row-col-1">
                <spring:message code="snpinsertiondeletion.list.label.chromosomeId"/>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#chromosomeIdentifier" target="_blank" data-toggle="tooltip" data-placement="right" title="Chromosome Id">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </th>
              <th class="row-2 row-col-2">
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=positionStart&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.positionstart"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#positionStart" target="_blank" data-toggle="tooltip" data-placement="right" title="Position Start">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </th>
              <th class="row-3 row-col-3">
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=positionEnd&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.positionend"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#positionEnd" target="_blank" data-toggle="tooltip" data-placement="right" title="Position End">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </th>
              <th class="row-4 row-col-4">
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=reference&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.reference"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#referenceAllele" target="_blank" data-toggle="tooltip" data-placement="right" title="Reference Allele">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </th>
              <th class="row-5 row-col-5">
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=alternative&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.alternative"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#alternativeAllele" target="_blank" data-toggle="tooltip" data-placement="right" title="Alternative Allele">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </th>
              
              <c:if test="${dtoDownload.isDownloadReferenceBreedI()}">
                <th class="row-6 row-col-6">
                  <spring:message code="snpinsertiondeletion.list.label.breedIAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed I">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedJ()}">
                <th class="row-6 row-col-6">
                  <spring:message code="snpinsertiondeletion.list.label.breedJAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed J">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedW()}">
                <th class="row-6 row-col-6">
                  <spring:message code="snpinsertiondeletion.list.label.breedWAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed W">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedN()}">
                <th class="row-6 row-col-6">
                  <spring:message code="snpinsertiondeletion.list.label.breedNAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed N">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedL()}">
                <th class="row-6 row-col-6">
                  <spring:message code="snpinsertiondeletion.list.label.breedLAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed L">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedZ()}">
                <th class="row-6 row-col-6">
                  <spring:message code="snpinsertiondeletion.list.label.breedZAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed Z">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>

              <c:if test="${dtoDownload.isDownloadAlternativeBreedI()}">
                <th class="row-7 row-col-7">
                  <spring:message code="snpinsertiondeletion.list.label.breedIAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed I">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadAlternativeBreedJ()}">
                <th class="row-7 row-col-7">
                  <spring:message code="snpinsertiondeletion.list.label.breedJAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed J">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadAlternativeBreedW()}">
                <th class="row-7 row-col-7">
                  <spring:message code="snpinsertiondeletion.list.label.breedWAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed W">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadAlternativeBreedN()}">
                <th class="row-7 row-col-7">
                  <spring:message code="snpinsertiondeletion.list.label.breedNAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed N">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadAlternativeBreedL()}">
                <th class="row-7 row-col-7">
                  <spring:message code="snpinsertiondeletion.list.label.breedLAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed L">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadAlternativeBreedZ()}">
                <th class="row-7 row-col-7">
                  <spring:message code="snpinsertiondeletion.list.label.breedZAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed Z">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              
            </tr>
          </c:if>
          
          <c:if test="${dtoDownload.isDownloadSortFieldScoreSift()}">
            <tr>
              <th class="row-1 row-col-1">
                <spring:message code="snpinsertiondeletion.list.label.chromosomeId"/>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#chromosomeIdentifier" target="_blank" data-toggle="tooltip" data-placement="right" title="Chromosome Id">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </th>
              <th class="row-2 row-col-2">
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=positionStart&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.positionstart"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#positionStart" target="_blank" data-toggle="tooltip" data-placement="right" title="Position Start">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </th>
              <th class="row-3 row-col-3">
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=positionEnd&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.positionend"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#positionEnd" target="_blank" data-toggle="tooltip" data-placement="right" title="Position End">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </th>
              <th class="row-4 row-col-4">
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=reference&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.reference"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#referenceAllele" target="_blank" data-toggle="tooltip" data-placement="right" title="Reference Allele">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </th>
              <th class="row-5 row-col-5">
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=alternative&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.alternative"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#alternativeAllele" target="_blank" data-toggle="tooltip" data-placement="right" title="Alternative Allele">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </th>
              
              <c:if test="${dtoDownload.isDownloadReferenceBreedI()}">
                <th class="row-6 row-col-6">
                  <spring:message code="snpinsertiondeletion.list.label.breedIAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed I">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedJ()}">
                <th class="row-6 row-col-6">
                  <spring:message code="snpinsertiondeletion.list.label.breedJAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed J">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedW()}">
                <th class="row-6 row-col-6">
                  <spring:message code="snpinsertiondeletion.list.label.breedWAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed W">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedN()}">
                <th class="row-6 row-col-6">
                  <spring:message code="snpinsertiondeletion.list.label.breedNAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed N">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedL()}">
                <th class="row-6 row-col-6">
                  <spring:message code="snpinsertiondeletion.list.label.breedLAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed L">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedZ()}">
                <th class="row-6 row-col-6">
                  <spring:message code="snpinsertiondeletion.list.label.breedZAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed Z">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>

              <c:if test="${dtoDownload.isDownloadAlternativeBreedI()}">
                <th class="row-7 row-col-7">
                  <spring:message code="snpinsertiondeletion.list.label.breedIAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed I">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadAlternativeBreedJ()}">
                <th class="row-7 row-col-7">
                  <spring:message code="snpinsertiondeletion.list.label.breedJAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed J">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadAlternativeBreedW()}">
                <th class="row-7 row-col-7">
                  <spring:message code="snpinsertiondeletion.list.label.breedWAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed W">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadAlternativeBreedN()}">
                <th class="row-7 row-col-7">
                  <spring:message code="snpinsertiondeletion.list.label.breedNAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed N">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadAlternativeBreedL()}">
                <th class="row-7 row-col-7">
                  <spring:message code="snpinsertiondeletion.list.label.breedLAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed L">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadAlternativeBreedZ()}">
                <th class="row-7 row-col-7">
                  <spring:message code="snpinsertiondeletion.list.label.breedZAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed Z">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              
            </tr>
          </c:if>
          
          <c:if test="${dtoDownload.isDownloadSortFieldScoreConservation()}">
            <tr>
              <th class="row-1 row-col-1">
                <spring:message code="snpinsertiondeletion.list.label.chromosomeId"/>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#chromosomeIdentifier" target="_blank" data-toggle="tooltip" data-placement="right" title="Chromosome Id">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </th>
              <th class="row-2 row-col-2">
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=positionStart&sortdir=asc" >
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.positionstart"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#positionStart" target="_blank" data-toggle="tooltip" data-placement="right" title="Position Start">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </th>
              <th class="row-3 row-col-3">
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=positionEnd&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.positionend"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#positionEnd" target="_blank" data-toggle="tooltip" data-placement="right" title="Position End">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </th>
              <th class="row-4 row-col-4">
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=reference&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.reference"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#referenceAllele" target="_blank" data-toggle="tooltip" data-placement="right" title="Reference Allele">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </th>
              <th class="row-5 row-col-5">
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=alternative&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.alternative"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#alternativeAllele" target="_blank" data-toggle="tooltip" data-placement="right" title="Alternative Allele">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </th>
              
              <c:if test="${dtoDownload.isDownloadReferenceBreedI()}">
                <th class="row-6 row-col-6">
                  <spring:message code="snpinsertiondeletion.list.label.breedIAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed I">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedJ()}">
                <th class="row-6 row-col-6">
                  <spring:message code="snpinsertiondeletion.list.label.breedJAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed J">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedW()}">
                <th class="row-6 row-col-6">
                  <spring:message code="snpinsertiondeletion.list.label.breedWAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed W">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedN()}">
                <th class="row-6 row-col-6">
                  <spring:message code="snpinsertiondeletion.list.label.breedNAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed N">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedL()}">
                <th class="row-6 row-col-6">
                  <spring:message code="snpinsertiondeletion.list.label.breedLAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed L">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedZ()}">
                <th class="row-6 row-col-6">
                  <spring:message code="snpinsertiondeletion.list.label.breedZAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed Z">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>

              <c:if test="${dtoDownload.isDownloadAlternativeBreedI()}">
                <th class="row-7 row-col-7">
                  <spring:message code="snpinsertiondeletion.list.label.breedIAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed I">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadAlternativeBreedJ()}">
                <th class="row-7 row-col-7">
                  <spring:message code="snpinsertiondeletion.list.label.breedJAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed J">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadAlternativeBreedW()}">
                <th class="row-7 row-col-7">
                  <spring:message code="snpinsertiondeletion.list.label.breedWAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed W">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadAlternativeBreedN()}">
                <th class="row-7 row-col-7">
                  <spring:message code="snpinsertiondeletion.list.label.breedNAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed N">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadAlternativeBreedL()}">
                <th class="row-7 row-col-7">
                  <spring:message code="snpinsertiondeletion.list.label.breedLAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed L">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadAlternativeBreedZ()}">
                <th class="row-7 row-col-7">
                  <spring:message code="snpinsertiondeletion.list.label.breedZAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed Z">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              
            </tr>
          </c:if>
          
          <c:if test="${dtoDownload.isDownloadSortFieldProteinAlignNumber()}">
            <tr>
              <th class="row-1 row-col-1">
                <spring:message code="snpinsertiondeletion.list.label.chromosomeId"/>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#chromosomeIdentifier" target="_blank" data-toggle="tooltip" data-placement="right" title="Chromosome Id">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </th>
              <th class="row-2 row-col-2">
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=positionStart&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.positionstart"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#positionStart" target="_blank" data-toggle="tooltip" data-placement="right" title="Position Start">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </th>
              <th class="row-3 row-col-3">
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=positionEnd&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.positionend"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#positionEnd" target="_blank" data-toggle="tooltip" data-placement="right" title="Position End">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </th>
              <th class="row-4 row-col-4">
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
              </th>
              <th class="row-5 row-col-5">
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=alternative&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.alternative"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#alternativeAllele" target="_blank" data-toggle="tooltip" data-placement="right" title="Alternative Allele">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </th>
              
              <c:if test="${dtoDownload.isDownloadReferenceBreedI()}">
                <th class="row-6 row-col-6">
                  <spring:message code="snpinsertiondeletion.list.label.breedIAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed I">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedJ()}">
                <th class="row-6 row-col-6">
                  <spring:message code="snpinsertiondeletion.list.label.breedJAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed J">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedW()}">
                <th class="row-6 row-col-6">
                  <spring:message code="snpinsertiondeletion.list.label.breedWAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed W">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedN()}">
                <th class="row-6 row-col-6">
                  <spring:message code="snpinsertiondeletion.list.label.breedNAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed N">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedL()}">
                <th class="row-6 row-col-6">
                  <spring:message code="snpinsertiondeletion.list.label.breedLAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed L">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedZ()}">
                <th class="row-6 row-col-6">
                  <spring:message code="snpinsertiondeletion.list.label.breedZAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed Z">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>

              <c:if test="${dtoDownload.isDownloadAlternativeBreedI()}">
                <th class="row-7 row-col-7">
                  <spring:message code="snpinsertiondeletion.list.label.breedIAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed I">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadAlternativeBreedJ()}">
                <th class="row-7 row-col-7">
                  <spring:message code="snpinsertiondeletion.list.label.breedJAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed J">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadAlternativeBreedW()}">
                <th class="row-7 row-col-7">
                  <spring:message code="snpinsertiondeletion.list.label.breedWAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed W">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadAlternativeBreedN()}">
                <th class="row-7 row-col-7">
                  <spring:message code="snpinsertiondeletion.list.label.breedNAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed N">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadAlternativeBreedL()}">
                <th class="row-7 row-col-7">
                  <spring:message code="snpinsertiondeletion.list.label.breedLAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed L">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadAlternativeBreedZ()}">
                <th class="row-7 row-col-7">
                  <spring:message code="snpinsertiondeletion.list.label.breedZAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed Z">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              
            </tr>
          </c:if>
          
          <c:if test="${dtoDownload.isDownloadSortFieldTotalAlignSequenceNumber()}">
            <tr>
              <th class="row-1 row-col-1">
                <spring:message code="snpinsertiondeletion.list.label.chromosomeId"/>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#chromosomeIdentifier" target="_blank" data-toggle="tooltip" data-placement="right" title="Chromosome Id">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </th>
              <th class="row-2 row-col-2">
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=positionStart&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.positionstart"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#positionStart" target="_blank" data-toggle="tooltip" data-placement="right" title="Position Start">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </th>
              <th class="row-3 row-col-3">
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=positionEnd&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.positionend"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#positionEnd" target="_blank" data-toggle="tooltip" data-placement="right" title="Position End">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </th>
              <th class="row-4 row-col-4">
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=reference&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.reference"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#referenceAllele" target="_blank" data-toggle="tooltip" data-placement="right" title="Reference Allele">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </th>
              <th class="row-5 row-col-5">
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=alternative&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.alternative"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#alternativeAllele" target="_blank" data-toggle="tooltip" data-placement="right" title="Alternative Allele">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </th>
              
              <c:if test="${dtoDownload.isDownloadReferenceBreedI()}">
                <th class="row-6 row-col-6">
                  <spring:message code="snpinsertiondeletion.list.label.breedIAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed I">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedJ()}">
                <th class="row-6 row-col-6">
                  <spring:message code="snpinsertiondeletion.list.label.breedJAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed J">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedW()}">
                <th class="row-6 row-col-6">
                  <spring:message code="snpinsertiondeletion.list.label.breedWAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed W">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedN()}">
                <th class="row-6 row-col-6">
                  <spring:message code="snpinsertiondeletion.list.label.breedNAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed N">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedL()}">
                <th class="row-6 row-col-6">
                  <spring:message code="snpinsertiondeletion.list.label.breedLAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed L">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedZ()}">
                <th class="row-6 row-col-6">
                  <spring:message code="snpinsertiondeletion.list.label.breedZAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed Z">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>

              <c:if test="${dtoDownload.isDownloadAlternativeBreedI()}">
                <th class="row-7 row-col-7">
                  <spring:message code="snpinsertiondeletion.list.label.breedIAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed I">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadAlternativeBreedJ()}">
                <th class="row-7 row-col-7">
                  <spring:message code="snpinsertiondeletion.list.label.breedJAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed J">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadAlternativeBreedW()}">
                <th class="row-7 row-col-7">
                  <spring:message code="snpinsertiondeletion.list.label.breedWAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed W">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadAlternativeBreedN()}">
                <th class="row-7 row-col-7">
                  <spring:message code="snpinsertiondeletion.list.label.breedNAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed N">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadAlternativeBreedL()}">
                <th class="row-7 row-col-7">
                  <spring:message code="snpinsertiondeletion.list.label.breedLAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed L">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadAlternativeBreedZ()}">
                <th class="row-7 row-col-7">
                  <spring:message code="snpinsertiondeletion.list.label.breedZAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed Z">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              
            </tr>
          </c:if>
          
          <c:if test="${dtoDownload.isDownloadSortFieldScoreProvean()}">
            <tr>
              <th class="row-1 row-col-1">
                <spring:message code="snpinsertiondeletion.list.label.chromosomeId"/>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#chromosomeIdentifier" target="_blank" data-toggle="tooltip" data-placement="right" title="Chromosome Id">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </th>
              <th class="row-2 row-col-2">
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=positionStart&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.positionstart"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#positionStart" target="_blank" data-toggle="tooltip" data-placement="right" title="Position Start">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </th>
              <th class="row-3 row-col-3">
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=positionEnd&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.positionend"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#positionEnd" target="_blank" data-toggle="tooltip" data-placement="right" title="Position End">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </th>
              <th class="row-4 row-col-4">
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=reference&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.reference"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#referenceAllele" target="_blank" data-toggle="tooltip" data-placement="right" title="Reference Allele">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </th>
              <th class="row-5 row-col-5">
                <a href="${pageContext.request.contextPath}/results/1?chr=${dtoDownload.getDownloadChromosomeAsString()}&low=${dtoDownload.downloadLowRange}&high=${dtoDownload.downloadHighRange}&ref=${dtoDownload.getDownloadReferenceAsString()}&alt=${dtoDownload.getDownloadAlternativeAsString()}&sortfield=alternative&sortdir=asc" >
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-214-arrow-up.png" alt="UP" height="15" width="15">
                  <spring:message code="snpinsertiondeletion.list.label.alternative"/>
                </a>
                <br />
                <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#alternativeAllele" target="_blank" data-toggle="tooltip" data-placement="right" title="Alternative Allele">
                  <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                </a>
              </th>

              <c:if test="${dtoDownload.isDownloadReferenceBreedI()}">
                <th class="row-6 row-col-6">
                  <spring:message code="snpinsertiondeletion.list.label.breedIAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed I">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedJ()}">
                <th class="row-6 row-col-6">
                  <spring:message code="snpinsertiondeletion.list.label.breedJAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed J">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedW()}">
                <th class="row-6 row-col-6">
                  <spring:message code="snpinsertiondeletion.list.label.breedWAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed W">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedN()}">
                <th class="row-6 row-col-6">
                  <spring:message code="snpinsertiondeletion.list.label.breedNAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed N">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedL()}">
                <th class="row-6 row-col-6">
                  <spring:message code="snpinsertiondeletion.list.label.breedLAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed L">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedZ()}">
                <th class="row-6 row-col-6">
                  <spring:message code="snpinsertiondeletion.list.label.breedZAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed Z">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>

              <c:if test="${dtoDownload.isDownloadAlternativeBreedI()}">
                <th class="row-7 row-col-7">
                  <spring:message code="snpinsertiondeletion.list.label.breedIAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed I">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadAlternativeBreedJ()}">
                <th class="row-7 row-col-7">
                  <spring:message code="snpinsertiondeletion.list.label.breedJAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed J">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadAlternativeBreedW()}">
                <th class="row-7 row-col-7">
                  <spring:message code="snpinsertiondeletion.list.label.breedWAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed W">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadAlternativeBreedN()}">
                <th class="row-7 row-col-7">
                  <spring:message code="snpinsertiondeletion.list.label.breedNAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed N">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadAlternativeBreedL()}">
                <th class="row-7 row-col-7">
                  <spring:message code="snpinsertiondeletion.list.label.breedLAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed L">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadAlternativeBreedZ()}">
                <th class="row-7 row-col-7">
                  <spring:message code="snpinsertiondeletion.list.label.breedZAlleles"/>
                  <br />
                  <a style="color:#5a5a5a;" href="${pageContext.request.contextPath}/search_results_help#strainX" target="_blank" data-toggle="tooltip" data-placement="right" title="Breed Z">
                    <img src="${pageContext.request.contextPath}/static/img/png/glyphicons-196-info-sign.png" alt="Help" height="15" width="15">
                  </a>
                </th>
              </c:if>

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
                <c:out value="${snpinsertiondeletion.positionStart}"/>
              </td>
              <td>
                <c:out value="${snpinsertiondeletion.positionEnd}"/>
              </td>
              <td>
                <c:out value="${snpinsertiondeletion.reference}"/>
              </td>
              <td>
                <c:out value="${snpinsertiondeletion.alternative}"/>
              </td>
              
              <c:if test="${dtoDownload.isDownloadReferenceBreedI()}">
                <td>
                  <c:out value="${snpinsertiondeletion.getBreedAllelesI()}"/>
                </td>
              </c:if>
              
              <c:if test="${dtoDownload.isDownloadReferenceBreedJ()}">
                <td>
                  <c:out value="${snpinsertiondeletion.getBreedAllelesJ()}"/>
                </td>
              </c:if>
              
              <c:if test="${dtoDownload.isDownloadReferenceBreedW()}">
                <td>
                  <c:out value="${snpinsertiondeletion.getBreedAllelesW()}"/>
                </td>
              </c:if>
              
              <c:if test="${dtoDownload.isDownloadReferenceBreedN()}">
                <td>
                  <c:out value="${snpinsertiondeletion.getBreedAllelesN()}"/>
                </td>
              </c:if>
              
              <c:if test="${dtoDownload.isDownloadReferenceBreedL()}">
                <td>
                  <c:out value="${snpinsertiondeletion.getBreedAllelesL()}"/>
                </td>
              </c:if>
              
              <c:if test="${dtoDownload.isDownloadReferenceBreedZ()}">
                <td>
                  <c:out value="${snpinsertiondeletion.getBreedAllelesZ()}"/>
                </td>
              </c:if>
            

              <c:if test="${dtoDownload.isDownloadAlternativeBreedI()}">
                <td>
                  <c:out value="${snpinsertiondeletion.getBreedAllelesI()}"/>
                </td>
              </c:if>
              
              <c:if test="${dtoDownload.isDownloadAlternativeBreedJ()}">
                <td>
                  <c:out value="${snpinsertiondeletion.getBreedAllelesJ()}"/>
                </td>
              </c:if>
              
              <c:if test="${dtoDownload.isDownloadAlternativeBreedW()}">
                <td>
                  <c:out value="${snpinsertiondeletion.getBreedAllelesW()}"/>
                </td>
              </c:if>
              
              <c:if test="${dtoDownload.isDownloadAlternativeBreedN()}">
                <td>
                  <c:out value="${snpinsertiondeletion.getBreedAllelesN()}"/>
                </td>
              </c:if>
              
              <c:if test="${dtoDownload.isDownloadAlternativeBreedL()}">
                <td>
                  <c:out value="${snpinsertiondeletion.getBreedAllelesL()}"/>
                </td>
              </c:if>
              
              <c:if test="${dtoDownload.isDownloadAlternativeBreedZ()}">
                <td>
                  <c:out value="${snpinsertiondeletion.getBreedAllelesZ()}"/>
                </td>
              </c:if>
            
            </tr>
          </c:forEach>

        </tbody>

      </table>
    </div>
    <!-- close span12 -->
  </div>
  <!-- close row spacer -->
</c:if>
