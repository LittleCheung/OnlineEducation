import request from '@/utils/request'

export default {
    //讲师列表（分页条件查询）
    getSubjectList(){
        return request({
            url: `/eduservice/subject/getAllSubject`,
            method: 'get',
        })
    }

    
}
