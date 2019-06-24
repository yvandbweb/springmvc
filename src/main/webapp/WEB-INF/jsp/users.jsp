          <!-- Content Row -->
          
          <%@include file="header.jsp" %>
          <%@include file="pagination.jsp" %>
			
			  <div class="row">
			    <div class="col-sm">
		          <div class="card shadow mb-4">
		            <div class="card-header py-3">
		              <h6 class="m-0 font-weight-bold text-primary">Posts and users</h6>
		            </div>
		            <div class="card-body">
		              <div class="table-responsive">
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
						        	<td class="datetime">${user.u.dateCreated}</td>
						        	<td class="poscom">${user.cntposts}</td>
						        	<td class="poscom">${user.cntcomments}</td>
						        	<td class="viewpost"><a href="<c:url value = "${pageurl}"/>?i2=${i1}<c:if test="${not empty fn:trim(search)}">&search=${search}</c:if>&iduserposts=${user.u.id}">
							        	<button type="button" class="btn btn-info">view posts</button>
							        	</a>
						        	</td>
						        	<td class="viewpost"><a href="<c:url value = "${pageurl}"/>?i2=${i1}<c:if test="${not empty fn:trim(search)}">&search=${search}</c:if>&idusercomments=${user.u.id}">
							        	<button type="button" class="btn btn-info">view comments</button>
							        	</a>
						        	</td>						        	
						        </tr>
					        </c:forEach>		       
		                  </tbody>
		                </table>
		                <c:if test="${empty userlist}">
		                	No ${pageurl} found
		                </c:if>
		                
		              </div>
		            </div>
		          </div>
			    </div>
			    <div class="col-sm">
			    	<div class="card border-left-primary shadow h-100 py-2">
						<div class="clear"></div>
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
				        		<b><i>${coml.user.nameuser} posted on ${coml.dateCreated}</i></b><br>
				        		${coml.txt}<br>
				        	</div>
				        	<div class="clear"></div>	    	
				        </c:forEach>							 	
				        <c:forEach items="${listcomments}" var="coml">
				        	<div class="post1 greycom">
				        		<b><i>${coml.user.nameuser} commented on ${coml.dateCreated}</i></b><br>
				        		${coml.text}<br>
				        	</div>
				        	<div class="clear"></div>	    	
				        </c:forEach>				        
			        </div>
			    </div>			    
			  </div>			

        
  <script>
  function listingpagination(v){
  		window.location.href="<c:url value = "${pageurl}"/>?i2="+v<c:if test="${not empty fn:trim(search)}">+"&search=${search}"</c:if>;
  }
  
  function not_allowed(v){
		alert("You are not allowed to "+v);
  }
  
  </script>        
        
<%@include file="footer.jsp" %>