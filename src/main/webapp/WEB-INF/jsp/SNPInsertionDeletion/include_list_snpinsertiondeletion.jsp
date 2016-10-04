<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<c:if test="${SNPInsertionDeletion != null && totalPages != 0}">
  <div class="row spacer">
    <div class="span12">

      <table id="indels" class="display" cellspacing="0" width="100%">

        <thead>
            <tr>
              <th><spring:message code="snpinsertiondeletion.list.label.chromosomeId"/></th>
              <th><spring:message code="snpinsertiondeletion.list.label.positionstart"/></th>
              <th><spring:message code="snpinsertiondeletion.list.label.positionend"/></th>
              <th><spring:message code="snpinsertiondeletion.list.label.reference"/></th>
              <th><spring:message code="snpinsertiondeletion.list.label.alternative"/></th>
              
              <c:if test="${dtoDownload.isDownloadReferenceBreedI()}">
                <th><spring:message code="snpinsertiondeletion.list.label.breedIAlleles"/></th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedJ()}">
                <th><spring:message code="snpinsertiondeletion.list.label.breedJAlleles"/></th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedW()}">
                <th><spring:message code="snpinsertiondeletion.list.label.breedWAlleles"/></th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedN()}">
                <th><spring:message code="snpinsertiondeletion.list.label.breedNAlleles"/></th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedL()}">
                <th><spring:message code="snpinsertiondeletion.list.label.breedLAlleles"/></th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedZ()}">
                <th><spring:message code="snpinsertiondeletion.list.label.breedZAlleles"/></th>
              </c:if>

              <c:if test="${dtoDownload.isDownloadAlternativeBreedI()}">
                <th><spring:message code="snpinsertiondeletion.list.label.breedIAlleles"/></th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadAlternativeBreedJ()}">
                <th><spring:message code="snpinsertiondeletion.list.label.breedJAlleles"/></th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadAlternativeBreedW()}">
                <th><spring:message code="snpinsertiondeletion.list.label.breedWAlleles"/></th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadAlternativeBreedN()}">
                <th><spring:message code="snpinsertiondeletion.list.label.breedNAlleles"/></th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadAlternativeBreedL()}">
                <th><spring:message code="snpinsertiondeletion.list.label.breedLAlleles"/></th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadAlternativeBreedZ()}">
                <th><spring:message code="snpinsertiondeletion.list.label.breedZAlleles"/></th>
              </c:if>
              
            </tr>
        </thead>
        
        <tfoot>
            <tr>
              <th><spring:message code="snpinsertiondeletion.list.label.chromosomeId"/></th>
              <th><spring:message code="snpinsertiondeletion.list.label.positionstart"/></th>
              <th><spring:message code="snpinsertiondeletion.list.label.positionend"/></th>
              <th><spring:message code="snpinsertiondeletion.list.label.reference"/></th>
              <th><spring:message code="snpinsertiondeletion.list.label.alternative"/></th>
              
              <c:if test="${dtoDownload.isDownloadReferenceBreedI()}">
                <th><spring:message code="snpinsertiondeletion.list.label.breedIAlleles"/></th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedJ()}">
                <th><spring:message code="snpinsertiondeletion.list.label.breedJAlleles"/></th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedW()}">
                <th><spring:message code="snpinsertiondeletion.list.label.breedWAlleles"/></th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedN()}">
                <th><spring:message code="snpinsertiondeletion.list.label.breedNAlleles"/></th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedL()}">
                <th><spring:message code="snpinsertiondeletion.list.label.breedLAlleles"/></th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedZ()}">
                <th><spring:message code="snpinsertiondeletion.list.label.breedZAlleles"/></th>
              </c:if>

              <c:if test="${dtoDownload.isDownloadAlternativeBreedI()}">
                <th><spring:message code="snpinsertiondeletion.list.label.breedIAlleles"/></th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadAlternativeBreedJ()}">
                <th><spring:message code="snpinsertiondeletion.list.label.breedJAlleles"/></th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadAlternativeBreedW()}">
                <th><spring:message code="snpinsertiondeletion.list.label.breedWAlleles"/></th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadAlternativeBreedN()}">
                <th><spring:message code="snpinsertiondeletion.list.label.breedNAlleles"/></th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadAlternativeBreedL()}">
                <th><spring:message code="snpinsertiondeletion.list.label.breedLAlleles"/></th>
              </c:if>
              <c:if test="${dtoDownload.isDownloadAlternativeBreedZ()}">
                <th><spring:message code="snpinsertiondeletion.list.label.breedZAlleles"/></th>
              </c:if>
              
            </tr>
        </tfoot>

        <tbody>
        
          <c:forEach items="${SNPInsertionDeletion}" var="snpinsertiondeletion" varStatus="rowStatus">

            <tr>

              <td><c:out value="${snpinsertiondeletion.chromosomeId}"/></td>
              <td><c:out value="${snpinsertiondeletion.positionStart}"/></td>
              <td><c:out value="${snpinsertiondeletion.positionEnd}"/></td>
              <td><c:out value="${snpinsertiondeletion.reference}"/></td>
              <td><c:out value="${snpinsertiondeletion.alternative}"/></td>
              
              <c:if test="${dtoDownload.isDownloadReferenceBreedI()}">
                <td><c:out value="${snpinsertiondeletion.getBreedAllelesI()}"/></td>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedJ()}">
                <td><c:out value="${snpinsertiondeletion.getBreedAllelesJ()}"/></td>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedW()}">
                <td><c:out value="${snpinsertiondeletion.getBreedAllelesW()}"/></td>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedN()}">
                <td><c:out value="${snpinsertiondeletion.getBreedAllelesN()}"/></td>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedL()}">
                <td><c:out value="${snpinsertiondeletion.getBreedAllelesL()}"/></td>
              </c:if>
              <c:if test="${dtoDownload.isDownloadReferenceBreedZ()}">
                <td><c:out value="${snpinsertiondeletion.getBreedAllelesZ()}"/></td>
              </c:if>

              <c:if test="${dtoDownload.isDownloadAlternativeBreedI()}">
                <td><c:out value="${snpinsertiondeletion.getBreedAllelesI()}"/></td>
              </c:if>
              <c:if test="${dtoDownload.isDownloadAlternativeBreedJ()}">
                <td><c:out value="${snpinsertiondeletion.getBreedAllelesJ()}"/></td>
              </c:if>
              <c:if test="${dtoDownload.isDownloadAlternativeBreedW()}">
                <td><c:out value="${snpinsertiondeletion.getBreedAllelesW()}"/></td>
              </c:if>
              <c:if test="${dtoDownload.isDownloadAlternativeBreedN()}">
                <td><c:out value="${snpinsertiondeletion.getBreedAllelesN()}"/></td>
              </c:if>
              <c:if test="${dtoDownload.isDownloadAlternativeBreedL()}">
                <td><c:out value="${snpinsertiondeletion.getBreedAllelesL()}"/></td>
              </c:if>
              <c:if test="${dtoDownload.isDownloadAlternativeBreedZ()}">
                <td><c:out value="${snpinsertiondeletion.getBreedAllelesZ()}"/></td>
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
