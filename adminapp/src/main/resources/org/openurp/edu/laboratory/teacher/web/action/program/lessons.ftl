[#ftl]
[@b.grid items=lessonList?sort_by(["course","code"]) var="lesson" sortable="false"]
	[@b.row]
		[@b.col width="4%" title="序号"]${lesson_index+1}[/@]
		[@b.col width="5%" property="no" title="attr.taskNo"]
		[@b.a href="!taskTable?lesson.id=${lesson.id}" title="${b.text('info.courseTable.lookFormTaskTip')}"]${lesson.no?if_exists}[/@]
		[/@]
		[@b.col width="20%" property="course.name" title="attr.courseName"/]
		[@b.col width="11%" property="courseType.name" title="entity.courseType"/]
		[@b.col width="17%" property="teachClass.name" title="entity.teachClass"/]
		[@b.col width="5%" property="course.credits" title="attr.credit"/]
		[@b.col width="5%" title="课时/周"]
			${(lesson.course.period)}/${lesson.courseSchedule.weekHour}
		[/@]
		[@b.col width="5%" title="起迄周"]
			${(lesson.courseSchedule.firstWeek)!('?')}-${(lesson.courseSchedule.lastWeek)!('?')}
		[/@]
		[@b.col width="5%" property="teachClass.stdCount" title="上课人数"]
			[@b.a href="!printAttendanceCheckList?lesson.id=${lesson.id}" title="查看点名册" target="_blank"]${lesson.teachClass.stdCount?default(0)}[/@]
		[/@]
		[@b.col width="22%" title="操作"]
		   [#if lesson.courseSchedule.period>0]
			[#if programMap.get(lesson)??]
			  [@b.a href="program!edit?program.id="+programMap.get(lesson).id]修改试验计划[/@]
			  [#if applyMap.get(lesson)??]
			    [@b.a href="apply!applyByLesson?apply.id="+applyMap.get(lesson).id]修改实验室[/@]
			  [#else]
			    [#if lesson.courseSchedule.activities?size>0]
			    [@b.a href="apply!applyByLesson?lesson.id="+lesson.id]申请实验室[/@]
			    [/#if]
			 [/#if] 
			[#else]
			  [@b.a href="program!edit?lesson.id="+lesson.id]新增试验计划[/@]
			[/#if]
		   [/#if]
		[/@]
	[/@]
[/@]