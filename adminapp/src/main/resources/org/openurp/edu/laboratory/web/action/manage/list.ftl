[#ftl]
[@b.head/]
[@b.grid items=applies var="apply"]
  [@b.gridbar]
    bar.addItem("${b.text("action.new")}",action.add());
    bar.addItem("${b.text("action.modify")}",action.edit());
    bar.addItem("${b.text("action.delete")}",action.remove("确认删除?"));
  [/@]
  [@b.row]
        [@b.boxcol /]
        [@b.col width="10%" property="applyType.name" title="征询表类型"/]
        [@b.col width="10%" property="lesson.no" title="课程序号"/]
        [@b.col width="10%" property="lesson.course.code" title="课程代码" /]
        [@b.col width="10%" property="lesson.course.name" title="课程名称" width="10%"/]
        [@b.col width="10%" property="teacher.user.name" title="教师" /]
        [@b.col width="10%" property="lesson.teachDepart.name" title="开课院系" /]
        [@b.col width="10%" property="lesson.teachclass.name" title="教学班名称" /]
        [@b.col width="10%" property="lesson.courseType.name" title="课程类别" /]
        [@b.col width="15%" property="softwares" title="环境要求"]
            [#list apply.softwares as software]
               ${(software.name)!}
               [#if software_has_next],[/#if]
            [/#list]
        [/@]
       [#-- [@b.col width="10%" property="lesson.teachDepart.name" title="实际安排" /]--]
       [@b.col width="15%" title="操作"]...[/@]
[/@]
[/@]
[@b.foot/]