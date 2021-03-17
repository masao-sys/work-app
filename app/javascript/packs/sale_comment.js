import $ from 'jquery'
import axios from 'axios'
import { csrfToken } from 'rails-ujs'

axios.defaults.headers.common['X-CSRF-Token'] = csrfToken()


document.addEventListener('DOMContentLoaded', () => {
  const dataset = $('#sale-show').data()
  const saleId = dataset.saleId
  axios.get(`/sales/${saleId}/sale_comments`)
    .then((response) => {
      const saleComments = response.data
      saleComments.forEach((sale_comment) => {
        $('.sale-comment-container').append(
          `<div class="information">
            <div class="information_wrap">
              <div class="information_detail">
                <div class="information_detail_image">
                  <a href="/accounts/${sale_comment.user.id}">
                    <img src="${sale_comment.user.avatar_image}"></img>
                  </a>
                </div>
                <div class="information_detail_user">
                  <div class="information_detail_user_name">
                    <p>${sale_comment.display_name}</p>
                  </div>
                  <div class="information_detail_user_create">
                    <p>${sale_comment.display_created_at}</p>
                  </div>
                </div>
              </div>
              <div class="information_content">
                <p>${sale_comment.content}</p>
              </div>
            </div>
          </div>`
        )
      })    
    })

    $('.sale-comment-form').on('click', () => {
      $('.sale-comment-form').addClass('hidden')
      $('.comment-text-area').removeClass('hidden')
    })

    $('.add-comment-button').on('click', () => {
      const content = $('#comment_content').val()
      if (!content) {
        window.alert('コメントを入力してください')
      } else {
        axios.post(`/sales/${saleId}/sale_comments`, {
          sale_comment: {content: content}
        })
          .then((res) => {
            const sale_comment = res.data
            $('.sale-comment-container').append(
              `<div class="information">
                <div class="information_wrap">
                  <div class="information_detail">
                    <div class="information_detail_image">
                      <a href="/accounts/${sale_comment.user.id}">
                        <img src="${sale_comment.user.avatar_image}"></img>
                      </a>
                    </div>
                    <div class="information_detail_user">
                      <div class="information_detail_user_name">
                        <p>${sale_comment.display_name}</p>
                      </div>
                      <div class="information_detail_user_create">
                        <p>${sale_comment.display_created_at}</p>
                      </div>
                    </div>
                  </div>
                  <div class="information_content">
                    <p>${sale_comment.content}</p>
                  </div>
                </div>
              </div>`
            )
            $('#comment_content').val('')
          })
      }
    })
})
