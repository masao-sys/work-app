import $ from 'jquery'
import axios from 'axios'
import { csrfToken } from 'rails-ujs'

axios.defaults.headers.common['X-CSRF-Token'] = csrfToken()


document.addEventListener('DOMContentLoaded', () => {
  const dataset = $('#management-show').data()
  const managementId = dataset.managementId
  axios.get(`/api/managements/${managementId}/management_comments`)
    .then((response) => {
      const managementComments = response.data
      managementComments.forEach((management_comment) => {
        $('.management-comment-container').append(
          `<div class="information">
            <div class="information_wrap">
              <div class="information_detail">
                <div class="information_detail_image">
                  <a href="/accounts/${management_comment.user.id}">
                    <img src="${management_comment.user.avatar_image}"></img>
                  </a>
                </div>
                <div class="information_detail_user">
                  <div class="information_detail_user_name">
                    <p>${management_comment.display_name}</p>
                  </div>
                  <div class="information_detail_user_create">
                    <p>${management_comment.display_created_at}</p>
                  </div>
                </div>
              </div>
              <div class="information_content">
                <p>${management_comment.content}</p>
              </div>
            </div>
          </div>`
        )
      })    
    })

    $('.management-comment-form').on('click', () => {
      $('.management-comment-form').addClass('hidden')
      $('.comment-text-area').removeClass('hidden')
    })

    $('.add-comment-button').on('click', () => {
      const content = $('#comment_content').val()
      if (!content) {
        window.alert('コメントを入力してください')
      } else {
        axios.post(`/api/managements/${managementId}/management_comments`, {
          management_comment: {content: content}
        })
          .then((res) => {
            const management_comment = res.data
            $('.management-comment-container').append(
              `<div class="information">
                <div class="information_wrap">
                  <div class="information_detail">
                    <div class="information_detail_image">
                      <a href="/accounts/${management_comment.user.id}">
                        <img src="${management_comment.user.avatar_image}"></img>
                      </a>
                    </div>
                    <div class="information_detail_user">
                      <div class="information_detail_user_name">
                        <p>${management_comment.display_name}</p>
                      </div>
                      <div class="information_detail_user_create">
                        <p>${management_comment.display_created_at}</p>
                      </div>
                    </div>
                  </div>
                  <div class="information_content">
                    <p>${management_comment.content}</p>
                  </div>
                </div>
              </div>`
            )
            $('#comment_content').val('')
          })
      }
    })
})
