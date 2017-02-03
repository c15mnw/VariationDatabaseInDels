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
              
              <c:if test="${dtoDownload.isSearchReferenceBreedI()}">
                <th><spring:message code="snpinsertiondeletion.list.label.breedIAlleles"/></th>
              </c:if>
              <c:if test="${dtoDownload.isSearchReferenceBreedJ()}">
                <th><spring:message code="snpinsertiondeletion.list.label.breedJAlleles"/></th>
              </c:if>
              <c:if test="${dtoDownload.isSearchReferenceBreedW()}">
                <th><spring:message code="snpinsertiondeletion.list.label.breedWAlleles"/></th>
              </c:if>
              <c:if test="${dtoDownload.isSearchReferenceBreedN()}">
                <th><spring:message code="snpinsertiondeletion.list.label.breedNAlleles"/></th>
              </c:if>
              <c:if test="${dtoDownload.isSearchReferenceBreedL()}">
                <th><spring:message code="snpinsertiondeletion.list.label.breedLAlleles"/></th>
              </c:if>
              <c:if test="${dtoDownload.isSearchReferenceBreedZ()}">
                <th><spring:message code="snpinsertiondeletion.list.label.breedZAlleles"/></th>
              </c:if>

              <c:if test="${dtoDownload.isSearchAlternativeBreedI()}">
                <th><spring:message code="snpinsertiondeletion.list.label.breedIAlleles"/></th>
              </c:if>
              <c:if test="${dtoDownload.isSearchAlternativeBreedJ()}">
                <th><spring:message code="snpinsertiondeletion.list.label.breedJAlleles"/></th>
              </c:if>
              <c:if test="${dtoDownload.isSearchAlternativeBreedW()}">
                <th><spring:message code="snpinsertiondeletion.list.label.breedWAlleles"/></th>
              </c:if>
              <c:if test="${dtoDownload.isSearchAlternativeBreedN()}">
                <th><spring:message code="snpinsertiondeletion.list.label.breedNAlleles"/></th>
              </c:if>
              <c:if test="${dtoDownload.isSearchAlternativeBreedL()}">
                <th><spring:message code="snpinsertiondeletion.list.label.breedLAlleles"/></th>
              </c:if>
              <c:if test="${dtoDownload.isSearchAlternativeBreedZ()}">
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
              
              <c:if test="${dtoDownload.isSearchReferenceBreedI()}">
                <th><spring:message code="snpinsertiondeletion.list.label.breedIAlleles"/></th>
              </c:if>
              <c:if test="${dtoDownload.isSearchReferenceBreedJ()}">
                <th><spring:message code="snpinsertiondeletion.list.label.breedJAlleles"/></th>
              </c:if>
              <c:if test="${dtoDownload.isSearchReferenceBreedW()}">
                <th><spring:message code="snpinsertiondeletion.list.label.breedWAlleles"/></th>
              </c:if>
              <c:if test="${dtoDownload.isSearchReferenceBreedN()}">
                <th><spring:message code="snpinsertiondeletion.list.label.breedNAlleles"/></th>
              </c:if>
              <c:if test="${dtoDownload.isSearchReferenceBreedL()}">
                <th><spring:message code="snpinsertiondeletion.list.label.breedLAlleles"/></th>
              </c:if>
              <c:if test="${dtoDownload.isSearchReferenceBreedZ()}">
                <th><spring:message code="snpinsertiondeletion.list.label.breedZAlleles"/></th>
              </c:if>

              <c:if test="${dtoDownload.isSearchAlternativeBreedI()}">
                <th><spring:message code="snpinsertiondeletion.list.label.breedIAlleles"/></th>
              </c:if>
              <c:if test="${dtoDownload.isSearchAlternativeBreedJ()}">
                <th><spring:message code="snpinsertiondeletion.list.label.breedJAlleles"/></th>
              </c:if>
              <c:if test="${dtoDownload.isSearchAlternativeBreedW()}">
                <th><spring:message code="snpinsertiondeletion.list.label.breedWAlleles"/></th>
              </c:if>
              <c:if test="${dtoDownload.isSearchAlternativeBreedN()}">
                <th><spring:message code="snpinsertiondeletion.list.label.breedNAlleles"/></th>
              </c:if>
              <c:if test="${dtoDownload.isSearchAlternativeBreedL()}">
                <th><spring:message code="snpinsertiondeletion.list.label.breedLAlleles"/></th>
              </c:if>
              <c:if test="${dtoDownload.isSearchAlternativeBreedZ()}">
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
              
              <c:if test="${dtoDownload.isSearchReferenceBreedI()}">
                <td><c:out value="${snpinsertiondeletion.getBreedAllelesI()}"/></td>
              </c:if>
              <c:if test="${dtoDownload.isSearchReferenceBreedJ()}">
                <td><c:out value="${snpinsertiondeletion.getBreedAllelesJ()}"/></td>
              </c:if>
              <c:if test="${dtoDownload.isSearchReferenceBreedW()}">
                <td><c:out value="${snpinsertiondeletion.getBreedAllelesW()}"/></td>
              </c:if>
              <c:if test="${dtoDownload.isSearchReferenceBreedN()}">
                <td><c:out value="${snpinsertiondeletion.getBreedAllelesN()}"/></td>
              </c:if>
              <c:if test="${dtoDownload.isSearchReferenceBreedL()}">
                <td><c:out value="${snpinsertiondeletion.getBreedAllelesL()}"/></td>
              </c:if>
              <c:if test="${dtoDownload.isSearchReferenceBreedZ()}">
                <td><c:out value="${snpinsertiondeletion.getBreedAllelesZ()}"/></td>
              </c:if>

              <c:if test="${dtoDownload.isSearchAlternativeBreedI()}">
                <td><c:out value="${snpinsertiondeletion.getBreedAllelesI()}"/></td>
              </c:if>
              <c:if test="${dtoDownload.isSearchAlternativeBreedJ()}">
                <td><c:out value="${snpinsertiondeletion.getBreedAllelesJ()}"/></td>
              </c:if>
              <c:if test="${dtoDownload.isSearchAlternativeBreedW()}">
                <td><c:out value="${snpinsertiondeletion.getBreedAllelesW()}"/></td>
              </c:if>
              <c:if test="${dtoDownload.isSearchAlternativeBreedN()}">
                <td><c:out value="${snpinsertiondeletion.getBreedAllelesN()}"/></td>
              </c:if>
              <c:if test="${dtoDownload.isSearchAlternativeBreedL()}">
                <td><c:out value="${snpinsertiondeletion.getBreedAllelesL()}"/></td>
              </c:if>
              <c:if test="${dtoDownload.isSearchAlternativeBreedZ()}">
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
