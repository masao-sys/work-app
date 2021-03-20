import $ from 'jquery'
import axios from 'axios'
import { csrfToken } from 'rails-ujs'

axios.defaults.headers.common['X-CSRF-Token'] = csrfToken()


document.addEventListener('DOMContentLoaded', () => {
  const dataset = $('#production-show').data()
  const productionId = dataset.productionId
  axios.get(`/productions/${productionId}/production_comments`)
    .then((response) => {
      const productionComments = response.data
      productionComments.forEach((production_comment) => {
        $('.production-comment-container').append(
          `<div class="information">
            <div class="information_wrap">
              <div class="information_detail">
                <div class="information_detail_image">
                  <a href="/accounts/${production_comment.user.id}">
                    <img src="${production_comment.user.avatar_image}"></img>
                  </a>
                </div>
                <div class="information_detail_user">
                  <div class="information_detail_user_name">
                    <p>${production_comment.display_name}</p>
                  </div>
                  <div class="information_detail_user_create">
                    <p>${production_comment.display_created_at}</p>
                  </div>
                </div>
              </div>
              <div class="information_content">
                <p>${production_comment.content}</p>
              </div>
            </div>
          </div>`
        )
      })    
    })

    $('.production-comment-form').on('click', () => {
      $('.production-comment-form').addClass('hidden')
      $('.comment-text-area').removeClass('hidden')
    })

    $('.add-comment-button').on('click', () => {
      const content = $('#comment_content').val()
      if (!content) {
        window.alert('コメントを入力してください')
      } else {
        axios.post(`/productions/${productionId}/production_comments`, {
          production_comment: {content: content}
        })
          .then((res) => {
            const production_comment = res.data
            $('.production-comment-container').append(
              `<div class="information">
                <div class="information_wrap">
                  <div class="information_detail">
                    <div class="information_detail_image">
                      <a href="/accounts/${production_comment.user.id}">
                        <img src="${production_comment.user.avatar_image}"></img>
                      </a>
                    </div>
                    <div class="information_detail_user">
                      <div class="information_detail_user_name">
                        <p>${production_comment.display_name}</p>
                      </div>
                      <div class="information_detail_user_create">
                        <p>${production_comment.display_created_at}</p>
                      </div>
                    </div>
                  </div>
                  <div class="information_content">
                    <p>${production_comment.content}</p>
                  </div>
                </div>
              </div>`
            )
            $('#comment_content').val('')
          })
      }
    })
})
