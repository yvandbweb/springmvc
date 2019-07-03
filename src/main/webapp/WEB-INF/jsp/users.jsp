          <!-- Content Row -->
          
          <%@include file="header.jsp" %>
          <%@include file="pagination.jsp" %>
			
			  <div class="row">
			      <div class="title1">Posts,Comments per user</div>
	              <div style="overflow-x:auto;">
	                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
	                  <thead>
	                    <tr>
	                      <th>User Name</th>		                      
	                      <th>Date created</th>
	                      <th>Posts</th>		                      
	                      <th>Comments</th>
	                    </tr>
	                  </thead>	
	                  <tbody>	    			
				        <c:forEach items="${userlist}" var="user" varStatus="count">
					        <tr class="tdblue <c:if test="${count.index % 2 == 0}">even</c:if><c:if test="${count.index % 2 != 0}">odd</c:if>">
					        	<td class="name">${user.u.nameuser}</td>
					        	<td class="datetime"><fmt:formatDate value="${user.u.dateCreated}" pattern="dd-MM-yyyy  HH:mm" /></td>
					        	<td class="viewpost"><a href="<c:url value = "${pageurl}"/>?i2=${i1}<c:if test="${not empty fn:trim(search)}">&search=${search}</c:if>&iduserposts=${user.u.id}">
						        	<button type="button" class="btn btn-info"><span class="showbuttext">view ${user.cntposts} posts</span> <span class="hidebuttext">view ${user.cntposts}</span></button>
						        	</a>
					        	</td>
					        	<td class="viewpost"><a href="<c:url value = "${pageurl}"/>?i2=${i1}<c:if test="${not empty fn:trim(search)}">&search=${search}</c:if>&idusercomments=${user.u.id}">
						        	<button type="button" class="btn btn-primary"><span class="showbuttext">view ${user.cntcomments} comments</span> <span class="hidebuttext">view ${user.cntcomments}</span></button>
						        	</a>
					        	</td>						        	
					        </tr>
				        </c:forEach>	
	                    <c:if test="${empty userlist}">
	                	   <tr><td colspan="4">No ${pageurl} found</td></tr>
	                    </c:if>				        	       
	                  </tbody>
	                </table>
	                </div>
	            </div>
	            <c:if test="${not empty userlist}">
			    <div class="row">
					<div class="Commenttitle">
					<c:if test="${not empty listcomments}">
	                	Comments
	                </c:if>
					<c:if test="${not empty listposts}">
	                	Posts
	                </c:if>		                
					</div><br/> 					
			        <c:forEach items="${listposts}" var="coml">
			        	<div class="post1">
			        		<b><i>${coml.user.nameuser} posted on <fmt:formatDate value="${coml.dateCreated}" pattern="dd-MM-yyyy HH:mm" /></i></b><br>
			        		${coml.txt}<br>
			        	</div>
			        	<div class="clear"></div>	    	
			        </c:forEach>							 	
			        <c:forEach items="${listcomments}" var="coml">
			        	<div class="post1 greycom">
			        		<b><i>${coml.user.nameuser} commented on <fmt:formatDate value="${coml.dateCreated}" pattern="dd-MM-yyyy HH:mm" /></i></b><br>
			        		${coml.text}<br>
			        	</div>
			        	<div class="clear"></div>	    	
			        </c:forEach>				        
		        </div>		
		        </c:if>

        
  <script>
  function listingpagination(v){
  		window.location.href="<c:url value = "${pageurl}"/>?i2="+v<c:if test="${not empty fn:trim(search)}">+"&search=${search}"</c:if>;
  }
  
  function not_allowed(v){
		alert("You are not allowed to "+v);
  }
  
  </script>        
        
<%@include file="footer.jsp" %>