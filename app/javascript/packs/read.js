import $ from 'jquery'
import axios from 'axios'
import { csrfToken } from 'rails-ujs'

axios.defaults.headers.common['X-CSRF-Token'] = csrfToken()

const handleReadDisplay = (hasRead) => {
  if (hasRead) {
    $('.active-read').removeClass('hidden')
  } else {
    $('.inactive-read').removeClass('hidden')
  }
}

document.addEventListener('DOMContentLoaded', () => {
  const dataset = $('#information-show').data()
  const informationId = dataset.informationId
  axios.get(`/api/informations/${informationId}/read`)
    .then((response) => {
      const hasRead = response.data.hasRead
      handleReadDisplay(hasRead)
    })

  $('.inactive-read').on('click', () => {
    axios.post(`/api/informations/${informationId}/read`)
      .then((response) => {
        if (response.data.status === 'ok') {
          $('.active-read').removeClass('hidden')
          $('.inactive-read').addClass('hidden')
          const readCount = $('.information_userRead_count').text();
          const numReadCount = parseInt(readCount)
          $('.information_userRead_count').text(numReadCount + 1)
        }
      })
      .catch((e) => {
        window.alert('Error')
        console.log(e)
      })
  })

  $('.active-read').on('click', () => {
    axios.delete(`/api/informations/${informationId}/read`)
      .then((response) => {
        if (response.data.status === 'ok') {
          $('.active-read').addClass('hidden')
          $('.inactive-read').removeClass('hidden')
          const readCount = $('.information_userRead_count').text();
          const numReadCount = parseInt(readCount)
          $('.information_userRead_count').text(numReadCount - 1)
        }
      })
      .catch((e) => {
        window.alert('Error')
        console.log(e)
      })
  })
})
