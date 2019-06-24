          <!-- Content Row -->
          
          <%@include file="header.jsp" %>
          <%@include file="pagination.jsp" %>
			
			  <div class="row">
			    <div class="col-sm">
		          <div class="card shadow mb-4">
		            <div class="card-header py-3">
		              <h6 class="m-0 font-weight-bold text-primary">Posts and users</h6>
		            </div>
		            <form method="post" class="posttext">
		            	<textarea></textarea><br>
		            	<input type="submit" value="Place a post" onclick="not_allowed('Post')">
		            </form>
		            <div class="card-body">
		              <div class="table-responsive">
		                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
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
						        	<td class="datetime">${post.p.dateCreated}</td>
						        	<td class="poscom">${post.cnt}</td>
						        	<td class="viewpost"><a href="<c:url value = "${pageurl}"/>?i2=${i1}<c:if test="${not empty fn:trim(search)}">&search=${search}</c:if>&idpost=${post.p.id}"><button type="button" class="btn btn-info">view comments</button></a></td>
						        </tr>
					        </c:forEach>		       
		                  </tbody>
		                </table>
		                <c:if test="${empty postlist}">
		                	No ${pageurl} found
		                </c:if>
		                
		              </div>
		            </div>
		          </div>
			    </div>
			    <div class="col-sm">
			    	<div class="card border-left-primary shadow h-100 py-2">
			    		<div class="post1">
					    	<b><i>${getfirstpost.user.nameuser} posted on ${getfirstpost.dateCreated}</i></b><br>
					    	${getfirstpost.txt}			    	
						</div>	
						<div class="clear"></div>
						<div class="Commenttitle">Comments</div><br/>  	
				        <c:forEach items="${listcom}" var="coml">
				        	<div class="post1 bubcomment greycom">
				        		<b><i>${coml.user.nameuser} commented on ${coml.dateCreated}</i></b><br>
				        		${coml.text}<br>
				        	</div>
				        	<div class="clear"></div>	    	
				        </c:forEach>
		            <form method="post" class="posttext">
		            	<textarea></textarea><br>
		            	<input type="submit" value="Place a comment"  onclick="not_allowed('comment')">
		            </form>				        
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