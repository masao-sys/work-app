import $ from 'jquery'
import axios from 'axios'
import { csrfToken } from 'rails-ujs'

axios.defaults.headers.common['X-CSRF-Token'] = csrfToken()


document.addEventListener('DOMContentLoaded', () => {
  const dataset = $('#development-show').data()
  const developmentId = dataset.developmentId
  axios.get(`/developments/${developmentId}/development_comments`)
    .then((response) => {
      const developmentComments = response.data
      developmentComments.forEach((development_comment) => {
        $('.development-comment-container').append(
          `<div class="information">
            <div class="information_wrap">
              <div class="information_detail">
                <div class="information_detail_image">
                  <a href="/accounts/${development_comment.user.id}">
                    <img src="${development_comment.user.avatar_image}"></img>
                  </a>
                </div>
                <div class="information_detail_user">
                  <div class="information_detail_user_name">
                    <p>${development_comment.display_name}</p>
                  </div>
                  <div class="information_detail_user_create">
                    <p>${development_comment.display_created_at}</p>
                  </div>
                </div>
              </div>
              <div class="information_content">
                <p>${development_comment.content}</p>
              </div>
            </div>
          </div>`
        )
      })    
    })

    $('.development-comment-form').on('click', () => {
      $('.development-comment-form').addClass('hidden')
      $('.comment-text-area').removeClass('hidden')
    })

    $('.add-comment-button').on('click', () => {
      const content = $('#comment_content').val()
      if (!content) {
        window.alert('コメントを入力してください')
      } else {
        axios.post(`/developments/${developmentId}/development_comments`, {
          development_comment: {content: content}
        })
          .then((res) => {
            const development_comment = res.data
            $('.development-comment-container').append(
              `<div class="information">
                <div class="information_wrap">
                  <div class="information_detail">
                    <div class="information_detail_image">
                      <a href="/accounts/${development_comment.user.id}">
                        <img src="${development_comment.user.avatar_image}"></img>
                      </a>
                    </div>
                    <div class="information_detail_user">
                      <div class="information_detail_user_name">
                        <p>${development_comment.display_name}</p>
                      </div>
                      <div class="information_detail_user_create">
                        <p>${development_comment.display_created_at}</p>
                      </div>
                    </div>
                  </div>
                  <div class="information_content">
                    <p>${development_comment.content}</p>
                  </div>
                </div>
              </div>`
            )
            $('#comment_content').val('')
          })
      }
    })
})
