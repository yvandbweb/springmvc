          <!-- Content Row -->
          
          <%@include file="header.jsp" %>
          <%@include file="pagination.jsp" %>
			
			  <div class="row">
			      <div class="title1">Posts,Comments per user</div>
	              <div>
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
					        	<td class="viewpost">
					        		<c:if test="${user.u.id!=iduserposts}">
							        	<button type="button" class="btn btn-info" onclick="userposts(${user.u.id})">
							        		<span>view ${user.cntposts} posts</span> 
							        	</button>
							        </c:if>		
							        <c:if test="${user.u.id==iduserposts}">	
							        	<button type="button" class="btn btn-success" onclick="userposts(-1)">
							        		<span>hide ${user.cntposts}</span>
							        	</button>
							        </c:if>		
					        	</td>
					        	<td class="viewpost">
					        		<c:if test="${user.u.id!=idusercomments}">
							        	<button type="button" class="btn btn-primary" onclick="usercomments(${user.u.id})">
							        		<span>view ${user.cntcomments} comments</span> 
							        	</button>
							        </c:if>		
									<c:if test="${user.u.id==idusercomments}">							        	
							        	<button type="button" class="btn btn-success" onclick="usercomments(-1)">
							        		<span>hide ${user.cntcomments}</span>
							        	</button>
							        </c:if>	 	
					        	</td>						        	
					        </tr>				       	
			            	<c:if test="${(not empty listposts && user.u.id==iduserposts) || (not empty listcomments && user.u.id==idusercomments)}">
			                <tr>
			                	<td colspan="4">	
									<c:if test="${not empty listposts && user.u.id==iduserposts}">
					                	<div class="Commenttitle">Posts</div>
								        <c:forEach items="${listposts}" var="coml">
								        	<div class="post1">
								        		<b><i>${coml.user.nameuser} posted on <fmt:formatDate value="${coml.dateCreated}" pattern="dd-MM-yyyy HH:mm" /></i></b><br>
								        		${coml.txt}<br>
								        	</div>
								        	<div class="clear"></div>	    	
								        </c:forEach>						                	
					                </c:if>		                		                				    
									<c:if test="${not empty listcomments && user.u.id==idusercomments}">
					                	<div class="Commenttitle">Comments</div> 
								        <c:forEach items="${listcomments}" var="coml">
								        	<div class="post1 greycom">
								        		<b><i>${coml.user.nameuser} commented on <fmt:formatDate value="${coml.dateCreated}" pattern="dd-MM-yyyy HH:mm" /></i></b><br>
								        		${coml.text}<br>
								        	</div>
								        	<div class="clear"></div>	    	
								        </c:forEach>						                	
					                </c:if>													 
					        	</td>
					        </tr>			        	
				        </c:if>					        		        		
	                    </c:forEach>			        	       
	                  </tbody>
	                </table>
	                </div>
	            </div>

        
  <script>
  function listingpagination(v){
  		window.location.href="<c:url value = "${pageurl}"/>?i2="+v<c:if test="${not empty fn:trim(search)}">+"&search=${search}"</c:if>;
  }
  
  function not_allowed(v){
		alert("You are not allowed to "+v);
  }
  
  function userposts(uid){
  		window.location.href="<c:url value = "${pageurl}"/>?i2=${i1}<c:if test="${not empty fn:trim(search)}">&search=${search}</c:if>&iduserposts="+uid;
  }
  
  function usercomments(uid){
  		window.location.href="<c:url value = "${pageurl}"/>?i2=${i1}<c:if test="${not empty fn:trim(search)}">&search=${search}</c:if>&idusercomments="+uid;
  }  
  
  </script>        
        
<%@include file="footer.jsp" %>