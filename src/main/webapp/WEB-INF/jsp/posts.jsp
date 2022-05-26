          <!-- Content Row -->
          
          <%@include file="header.jsp" %>
          <%@include file="pagination.jsp" %>
			
			  <div class="row">
	              <div class="title1">Posts from users</div>
	              <div>
	                <table class="table table-bordered" id="dataTable" cellspacing="0">
	                  <thead>
	                    <tr>
	                      <th>User Name</th>
	                      <th>Post</th>
	                      <th>Date posted</th>
	                      <th>Comments</th>
	                    </tr>
	                  </thead>	
	                  <tbody>	    			
				        <c:forEach items="${postlist}" var="post" varStatus="count">
					        <tr class="tdblue <c:if test="${count.index % 2 == 0}">even</c:if><c:if test="${count.index % 2 != 0}">odd</c:if>">
					        	<td class="name">${post.p.user.nameuser}</td>
					        	<c:set var = "string1" value = "${post.p.txt}"/>
					        	<td class="txt">${fn:substring(string1, 1, 80)} ... </td>
					        	<td class="datetime"><fmt:formatDate value="${post.p.dateCreated}" pattern="dd-MM-yyyy HH:mm" /></td>
					        	<td class="viewpost">
					        	 <c:if test="${post.p.id!=postid}">
						        	<button type="button" onclick="showcomments(${post.p.id})" class="btn btn-info">
						        		<span>view ${post.cnt} comments</span> 
						        	</button>
					        	</c:if>
					        	 <c:if test="${not empty postlist && post.p.id==postid}">
					        	<button type="button" onclick="showcomments(-1)" class="btn btn-success">
					        		<span>Hide ${post.cnt}</span>
					        		</button>
					        	</c:if>					        	
					        	</td>
					        </tr>
				            <c:if test="${not empty postlist && post.p.id==postid}">
					            <tr>
					            	<td colspan="4">
									    <div class="row">
								    		<div class="post1">
										    	<b><i>${getfirstpost.user.nameuser} posted on ${getfirstpost.dateCreated}</i></b><br>
										    	${getfirstpost.txt}			    	
											</div>	
											<div class="clear"></div>
											<div class="Commenttitle">Comments</div><br/>  	
									        <c:forEach items="${listcom}" var="coml">
									        	<div class="post1 bubcomment greycom">
									        		<b><i>${coml.user.nameuser} commented on <fmt:formatDate value="${coml.dateCreated}" pattern="dd-MM-yyyy HH:mm" /></i></b><br>
									        		${coml.text}<br>
									        	</div>
									        	<div class="clear"></div>	    	
									        </c:forEach>				        		        
								        </div>
						        	</td>
						        </tr>					        
					        </c:if>	
		                    <c:if test="${empty postlist && post.p.id==postid}">
		                	   <tr><td colspan="4">No ${pageurl} found</td></tr>
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
  
  function showcomments(pda){
  	window.location.href="<c:url value = "${pageurl}"/>?i2=${i1}<c:if test="${not empty fn:trim(search)}">&search=${search}</c:if>&idpost="+pda;
  
  }  
  
  </script>        
        
<%@include file="footer.jsp" %>