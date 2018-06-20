<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
 <!-- Bootstrap core CSS     --> 
15     <link href="assets/css/bootstrap.min.css" rel="stylesheet" /> 
16 
 
17     <!-- Animation library for notifications   --> 
18     <link href="assets/css/animate.min.css" rel="stylesheet"/> 
19 
 
20     <!--  Light Bootstrap Table core CSS    --> 
21     <link href="assets/css/light-bootstrap-dashboard.css?v=1.4.0" rel="stylesheet"/> 
22 
 
23 
 
24     <!--  CSS for Demo Purpose, don't include it in your project     --> 
25     <link href="assets/css/demo.css" rel="stylesheet" /> 
26 
 
27 
 
28     <!--     Fonts and icons     --> 
29     <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet"> 
30     <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'> 
31     <link href="assets/css/pe-icon-7-stroke.css" rel="stylesheet" /> 




</head>
<body>

36 <div class="wrapper"> 
37     <div class="sidebar" data-color="purple" data-image="assets/img/sidebar-5.jpg"> 
38 
 
39     <!-- 
40  
41         Tip 1: you can change the color of the sidebar using: data-color="blue | azure | green | orange | red | purple" 
42         Tip 2: you can also add an image using data-image tag 
43  
44     --> 
45 
 
46     	<div class="sidebar-wrapper"> 
47             <div class="logo"> 
48                 <a href="http://www.creative-tim.com" class="simple-text"> 
49                     Creative Tim 
50                 </a> 
51             </div> 
52 
 
53             <ul class="nav"> 
54                 <li class="active"> 
55                     <a href="dashboard.html"> 
56                         <i class="pe-7s-graph"></i> 
57                         <p>Dashboard</p> 
58                     </a> 
59                 </li> 
60                 <li> 
61                     <a href="user.html"> 
62                         <i class="pe-7s-user"></i> 
63                         <p>User Profile</p> 
64                     </a> 
65                 </li> 
66                 <li> 
67                     <a href="table.html"> 
68                         <i class="pe-7s-note2"></i> 
69                         <p>Table List</p> 
70                     </a> 
71                 </li> 
72                 <li> 
73                     <a href="typography.html"> 
74                         <i class="pe-7s-news-paper"></i> 
75                         <p>Typography</p> 
76                     </a> 
77                 </li> 
78                 <li> 
79                     <a href="icons.html"> 
80                         <i class="pe-7s-science"></i> 
81                         <p>Icons</p> 
82                     </a> 
83                 </li> 
84                 <li> 
85                     <a href="maps.html"> 
86                         <i class="pe-7s-map-marker"></i> 
87                         <p>Maps</p> 
88                     </a> 
89                 </li> 
90                 <li> 
91                     <a href="notifications.html"> 
92                         <i class="pe-7s-bell"></i> 
93                         <p>Notifications</p> 
94                     </a> 
95                 </li> 
96 				<li class="active-pro"> 
97                     <a href="upgrade.html"> 
98                         <i class="pe-7s-rocket"></i> 
99                         <p>Upgrade to PRO</p> 
100                     </a> 
101                 </li> 
102             </ul> 
103     	</div> 
104     </div> 
105 
 
106     <div class="main-panel"> 
107         <nav class="navbar navbar-default navbar-fixed"> 
108             <div class="container-fluid"> 
109                 <div class="navbar-header"> 
110                     <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navigation-example-2"> 
111                         <span class="sr-only">Toggle navigation</span> 
112                         <span class="icon-bar"></span> 
113                         <span class="icon-bar"></span> 
114                         <span class="icon-bar"></span> 
115                     </button> 
116                     <a class="navbar-brand" href="#">Dashboard</a> 
117                 </div> 
118                 <div class="collapse navbar-collapse"> 
119                     <ul class="nav navbar-nav navbar-left"> 
120                         <li> 
121                             <a href="#" class="dropdown-toggle" data-toggle="dropdown"> 
122                                 <i class="fa fa-dashboard"></i> 
123 								<p class="hidden-lg hidden-md">Dashboard</p> 
124                             </a> 
125                         </li> 
126                         <li class="dropdown"> 
127                               <a href="#" class="dropdown-toggle" data-toggle="dropdown"> 
128                                     <i class="fa fa-globe"></i> 
129                                     <b class="caret hidden-lg hidden-md"></b> 
130 									<p class="hidden-lg hidden-md"> 
131 										5 Notifications 
132 										<b class="caret"></b> 
133 									</p> 
134                               </a> 
135                               <ul class="dropdown-menu"> 
136                                 <li><a href="#">Notification 1</a></li> 
137                                 <li><a href="#">Notification 2</a></li> 
138                                 <li><a href="#">Notification 3</a></li> 
139                                 <li><a href="#">Notification 4</a></li> 
140                                 <li><a href="#">Another notification</a></li> 
141                               </ul> 
142                         </li> 
143                         <li> 
144                            <a href=""> 
145                                 <i class="fa fa-search"></i> 
146 								<p class="hidden-lg hidden-md">Search</p> 
147                             </a> 
148                         </li> 
149                     </ul> 
150 
 
151                     <ul class="nav navbar-nav navbar-right"> 
152                         <li> 
153                            <a href=""> 
154                                <p>Account</p> 
155                             </a> 
156                         </li> 
157                         <li class="dropdown"> 
158                               <a href="#" class="dropdown-toggle" data-toggle="dropdown"> 
159                                     <p> 
160 										Dropdown 
161 										<b class="caret"></b> 
162 									</p> 
163 
 
164                               </a> 
165                               <ul class="dropdown-menu"> 
166                                 <li><a href="#">Action</a></li> 
167                                 <li><a href="#">Another action</a></li> 
168                                 <li><a href="#">Something</a></li> 
169                                 <li><a href="#">Another action</a></li> 
170                                 <li><a href="#">Something</a></li> 
171                                 <li class="divider"></li> 
172                                 <li><a href="#">Separated link</a></li> 
173                               </ul> 
174                         </li> 
175                         <li> 
176                             <a href="#"> 
177                                 <p>Log out</p> 
178                             </a> 
179                         </li> 
180 						<li class="separator hidden-lg"></li> 
181                     </ul> 
182                 </div> 
183             </div> 
184         </nav> 
185 
 
186 
 
187         <div class="content"> 
188             <div class="container-fluid"> 
189                 <div class="row"> 
190                     <div class="col-md-4"> 
191                         <div class="card"> 
192 
 
193                             <div class="header"> 
194                                 <h4 class="title">Email Statistics</h4> 
195                                 <p class="category">Last Campaign Performance</p> 
196                             </div> 
197                             <div class="content"> 
198                                 <div id="chartPreferences" class="ct-chart ct-perfect-fourth"></div> 
199 
 
200                                 <div class="footer"> 
201                                     <div class="legend"> 
202                                         <i class="fa fa-circle text-info"></i> Open 
203                                         <i class="fa fa-circle text-danger"></i> Bounce 
204                                         <i class="fa fa-circle text-warning"></i> Unsubscribe 
205                                     </div> 
206                                     <hr> 
207                                     <div class="stats"> 
208                                         <i class="fa fa-clock-o"></i> Campaign sent 2 days ago 
209                                     </div> 
210                                 </div> 
211                             </div> 
212                         </div> 
213                     </div> 
214 
 
215                     <div class="col-md-8"> 
216                         <div class="card"> 
217                             <div class="header"> 
218                                 <h4 class="title">Users Behavior</h4> 
219                                 <p class="category">24 Hours performance</p> 
220                             </div> 
221                             <div class="content"> 
222                                 <div id="chartHours" class="ct-chart"></div> 
223                                 <div class="footer"> 
224                                     <div class="legend"> 
225                                         <i class="fa fa-circle text-info"></i> Open 
226                                         <i class="fa fa-circle text-danger"></i> Click 
227                                         <i class="fa fa-circle text-warning"></i> Click Second Time 
228                                     </div> 
229                                     <hr> 
230                                     <div class="stats"> 
231                                         <i class="fa fa-history"></i> Updated 3 minutes ago 
232                                     </div> 
233                                 </div> 
234                             </div> 
235                         </div> 
236                     </div> 
237                 </div> 
238 
 
239 
 
240 
 
241                 <div class="row"> 
242                     <div class="col-md-6"> 
243                         <div class="card "> 
244                             <div class="header"> 
245                                 <h4 class="title">2014 Sales</h4> 
246                                 <p class="category">All products including Taxes</p> 
247                             </div> 
248                             <div class="content"> 
249                                 <div id="chartActivity" class="ct-chart"></div> 
250 
 
251                                 <div class="footer"> 
252                                     <div class="legend"> 
253                                         <i class="fa fa-circle text-info"></i> Tesla Model S 
254                                         <i class="fa fa-circle text-danger"></i> BMW 5 Series 
255                                     </div> 
256                                     <hr> 
257                                     <div class="stats"> 
258                                         <i class="fa fa-check"></i> Data information certified 
259                                     </div> 
260                                 </div> 
261                             </div> 
262                         </div> 
263                     </div> 
264 
 
265                     <div class="col-md-6"> 
266                         <div class="card "> 
267                             <div class="header"> 
268                                 <h4 class="title">Tasks</h4> 
269                                 <p class="category">Backend development</p> 
270                             </div> 
271                             <div class="content"> 
272                                 <div class="table-full-width"> 
273                                     <table class="table"> 
274                                         <tbody> 
275                                             <tr> 
276                                                 <td> 
277 													<div class="checkbox"> 
278 						  							  	<input id="checkbox1" type="checkbox"> 
279 						  							  	<label for="checkbox1"></label> 
280 					  						  		</div> 
281                                                 </td> 
282                                                 <td>Sign contract for "What are conference organizers afraid of?"</td> 
283                                                 <td class="td-actions text-right"> 
284                                                     <button type="button" rel="tooltip" title="Edit Task" class="btn btn-info btn-simple btn-xs"> 
285                                                         <i class="fa fa-edit"></i> 
286                                                     </button> 
287                                                     <button type="button" rel="tooltip" title="Remove" class="btn btn-danger btn-simple btn-xs"> 
288                                                         <i class="fa fa-times"></i> 
289                                                     </button> 
290                                                 </td> 
291                                             </tr> 
292                                             <tr> 
293                                                 <td> 
294 													<div class="checkbox"> 
295 						  							  	<input id="checkbox2" type="checkbox" checked> 
296 						  							  	<label for="checkbox2"></label> 
297 					  						  		</div> 
298                                                 </td> 
299                                                 <td>Lines From Great Russian Literature? Or E-mails From My Boss?</td> 
300                                                 <td class="td-actions text-right"> 
301                                                     <button type="button" rel="tooltip" title="Edit Task" class="btn btn-info btn-simple btn-xs"> 
302                                                         <i class="fa fa-edit"></i> 
303                                                     </button> 
304                                                     <button type="button" rel="tooltip" title="Remove" class="btn btn-danger btn-simple btn-xs"> 
305                                                         <i class="fa fa-times"></i> 
306                                                     </button> 
307                                                 </td> 
308                                             </tr> 
309                                             <tr> 
310                                                 <td> 
311 													<div class="checkbox"> 
312 						  							  	<input id="checkbox3" type="checkbox"> 
313 						  							  	<label for="checkbox3"></label> 
314 					  						  		</div> 
315                                                 </td> 
316                                                 <td>Flooded: One year later, assessing what was lost and what was found when a ravaging rain swept through metro Detroit 
317 												</td> 
318                                                 <td class="td-actions text-right"> 
319                                                     <button type="button" rel="tooltip" title="Edit Task" class="btn btn-info btn-simple btn-xs"> 
320                                                         <i class="fa fa-edit"></i> 
321                                                     </button> 
322                                                     <button type="button" rel="tooltip" title="Remove" class="btn btn-danger btn-simple btn-xs"> 
323                                                         <i class="fa fa-times"></i> 
324                                                     </button> 
325                                                 </td> 
326                                             </tr> 
327                                             <tr> 
328                                                 <td> 
329 													<div class="checkbox"> 
330 						  							  	<input id="checkbox4" type="checkbox" checked> 
331 						  							  	<label for="checkbox4"></label> 
332 					  						  		</div> 
333                                                 </td> 
334                                                 <td>Create 4 Invisible User Experiences you Never Knew About</td> 
335                                                 <td class="td-actions text-right"> 
336                                                     <button type="button" rel="tooltip" title="Edit Task" class="btn btn-info btn-simple btn-xs"> 
337                                                         <i class="fa fa-edit"></i> 
338                                                     </button> 
339                                                     <button type="button" rel="tooltip" title="Remove" class="btn btn-danger btn-simple btn-xs"> 
340                                                         <i class="fa fa-times"></i> 
341                                                     </button> 
342                                                 </td> 
343                                             </tr> 
344                                             <tr> 
345                                                 <td> 
346 													<div class="checkbox"> 
347 						  							  	<input id="checkbox5" type="checkbox"> 
348 						  							  	<label for="checkbox5"></label> 
349 					  						  		</div> 
350                                                 </td> 
351                                                 <td>Read "Following makes Medium better"</td> 
352                                                 <td class="td-actions text-right"> 
353                                                     <button type="button" rel="tooltip" title="Edit Task" class="btn btn-info btn-simple btn-xs"> 
354                                                         <i class="fa fa-edit"></i> 
355                                                     </button> 
356                                                     <button type="button" rel="tooltip" title="Remove" class="btn btn-danger btn-simple btn-xs"> 
357                                                         <i class="fa fa-times"></i> 
358                                                     </button> 
359                                                 </td> 
360                                             </tr> 
361                                             <tr> 
362                                                 <td> 
363 													<div class="checkbox"> 
364 						  							  	<input id="checkbox6" type="checkbox" checked> 
365 						  							  	<label for="checkbox6"></label> 
366 					  						  		</div> 
367                                                 </td> 
368                                                 <td>Unfollow 5 enemies from twitter</td> 
369                                                 <td class="td-actions text-right"> 
370                                                     <button type="button" rel="tooltip" title="Edit Task" class="btn btn-info btn-simple btn-xs"> 
371                                                         <i class="fa fa-edit"></i> 
372                                                     </button> 
373                                                     <button type="button" rel="tooltip" title="Remove" class="btn btn-danger btn-simple btn-xs"> 
374                                                         <i class="fa fa-times"></i> 
375                                                     </button> 
376                                                 </td> 
377                                             </tr> 
378                                         </tbody> 
379                                     </table> 
380                                 </div> 
381 
 
382                                 <div class="footer"> 
383                                     <hr> 
384                                     <div class="stats"> 
385                                         <i class="fa fa-history"></i> Updated 3 minutes ago 
386                                     </div> 
387                                 </div> 
388                             </div> 
389                         </div> 
390                     </div> 
391                 </div> 
392             </div> 
393         </div> 
394 
 
395 
 
396         <footer class="footer"> 
397             <div class="container-fluid"> 
398                 <nav class="pull-left"> 
399                     <ul> 
400                         <li> 
401                             <a href="#"> 
402                                 Home 
403                             </a> 
404                         </li> 
405                         <li> 
406                             <a href="#"> 
407                                 Company 
408                             </a> 
409                         </li> 
410                         <li> 
411                             <a href="#"> 
412                                 Portfolio 
413                             </a> 
414                         </li> 
415                         <li> 
416                             <a href="#"> 
417                              
418                             </a> 
419                         </li> 
420                     </ul> 
421                 </nav> 
422                 <p class="copyright pull-right"> 
423                     &copy; <script>document.write(new Date().getFullYear())</script> <a href="http://www.creative-tim.com">Creative Tim</a>, made with love for a better web 
424                 </p> 
425             </div> 
426         </footer> 
427 
 
428     </div> 
429 </div> 
430 
 
431 
 
432 </body> 
433 
 
434     <!--   Core JS Files   --> 
435     <script src="assets/js/jquery.3.2.1.min.js" type="text/javascript"></script> 
436 	<script src="assets/js/bootstrap.min.js" type="text/javascript"></script> 
437 
 
438 	<!--  Charts Plugin --> 
439 	<script src="assets/js/chartist.min.js"></script> 
440 
 
441     <!--  Notifications Plugin    --> 
442     <script src="assets/js/bootstrap-notify.js"></script> 
443 
 
444     <!--  Google Maps Plugin    --> 
445     <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script> 
446 
 
447     <!-- Light Bootstrap Table Core javascript and methods for Demo purpose --> 
448 	<script src="assets/js/light-bootstrap-dashboard.js?v=1.4.0"></script> 
449 
 
450 	<!-- Light Bootstrap Table DEMO methods, don't include it in your project! --> 
451 	<script src="assets/js/demo.js"></script> 
452 
 
453 	<script type="text/javascript"> 
454     	$(document).ready(function(){ 
455  
456         	demo.initChartist(); 
457  
458         	$.notify({ 
459             	icon: 'pe-7s-gift', 
460             	message: "Welcome to <b>Light Bootstrap Dashboard</b> - a beautiful freebie for every web developer." 
461  
462             },{ 
463                 type: 'info', 
464                 timer: 4000 
465             }); 
466  
467     	}); 
468 	</script> 

</body>
</html>