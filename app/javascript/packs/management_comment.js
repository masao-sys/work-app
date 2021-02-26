import $ from 'jquery'
import axios from 'axios'
import { csrfToken } from 'rails-ujs'

axios.defaults.headers.common['X-CSRF-Token'] = csrfToken()


document.addEventListener('DOMContentLoaded', () => {
  const dataset = $('#management-show').data()
  const managementId = dataset.managementId
  axios.get(`/managements/${managementId}/management_comments`)
    .then((response) => {
      const managementComments = response.data
      managementComments.forEach((management_comment) => {
        $('.management-comment-container').append(
          `<div class="article_comment"><p>${management_comment.content}</p></div>`
        )
      })    
    })
})
