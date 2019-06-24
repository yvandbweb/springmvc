  <nav aria-label="Page navigation example">
      <ul class="pagination">
      
			<c:forEach var="i" begin="0" end="${totalrest}" step="1" varStatus="loop">
			    <li class="page-item <c:if test="${i1 == loop.index+1}"> active </c:if>"><span class="page-link" onclick="listingpagination(${loop.index+1})" >${loop.index+1}</span></li>
			</c:forEach>      			      
      </ul>
  </nav>   
 