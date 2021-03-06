[#ftl]
[@b.grid items=lessonList?sort_by(["course","code"]) var="lesson" sortable="false"]
	[@b.row]
		[@b.col width="4%" title="序号"]${lesson_index+1}[/@]
		[@b.col width="5%" property="no" title="attr.taskNo"]${lesson.no?if_exists}[/@]
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
		[@b.col width="5%" property="teachClass.stdCount" title="上课人数"/]
		[@b.col width="11%" title="实验计划"]
		   [#if lesson.courseSchedule.period>0]
			[#if programMap.get(lesson)??]
			  [@b.a href="program!edit?program.id="+programMap.get(lesson).id]修改[/@]
			[#else]
			  [@b.a href="program!edit?lesson.id="+lesson.id]新增[/@]
			[/#if]
		   [/#if]
		[/@]
		[@b.col width="11%" title="实验室申请"]
       [#if lesson.courseSchedule.period>0]
      [#if programMap.get(lesson)??]
        [#if applyMap.get(lesson)??]
          [@b.a href="apply!applyByLesson?apply.id="+applyMap.get(lesson).id]修改[/@]
    [#--      [@b.a href="apply!applyByLesson?lesson.id="+lesson.id]新增[/@]--]
        [#else]
          [#if lesson.courseSchedule.activities?size>0]
          [@b.a href="apply!applyByLesson?lesson.id="+lesson.id]申请[/@]
          [/#if]
       [/#if] 
      [/#if]
       [/#if]
    [/@]
	[/@]
[/@]