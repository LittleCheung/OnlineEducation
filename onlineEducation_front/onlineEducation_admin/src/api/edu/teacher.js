import request from '@/utils/request'

export default {
    //讲师列表（分页条件查询）

    getTeacherListPage(current, limit, teachQuery) {
        return request({
            url: `/eduservice/teacher/pageTeacherCondition/${current}/${limit}`,
            method: 'post',
            //teachQuery条件对象，后端用requestbody获取数据
            //data表示把对象转换成json数据传递到接口里面

            data: teachQuery
        })
    },
    //删除讲师
    deleteTeacherId(id) {
        return request({
            url: `/eduservice/teacher/${id}`,
            method: 'delete'
        })
    },

    //添加讲师
    addTeacher(teacher) {
        return request({
            url: `/eduservice/teacher/addTeacher`,
            method: 'post',
            data: teacher
        })
    },
    //根据id查询讲师，做回显
    getTeacherInfo(id) {
        return request({
            url: `/eduservice/teacher/getTeacher/${id}`,
            method: 'get',
        })
    },

    //修改讲师
    updateTeacher(teacher) {
        return request({
            url: `/eduservice/teacher/updateTeacher`,
            method: 'post',
            data: teacher
        })
    }
}
