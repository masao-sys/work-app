import $ from 'jquery'
import axios from 'axios'
import { csrfToken } from 'rails-ujs'

axios.defaults.headers.common['X-CSRF-Token'] = csrfToken()

const handleBookmarkDisplay = (hasBookmark) => {
  if (hasBookmark) {
    $('.active-bookmark').removeClass('hidden')
  } else {
    $('.inactive-bookmark').removeClass('hidden')
  }
}

document.addEventListener('DOMContentLoaded', () => {
  const dataset = $('#information-show').data()
  const informationId = dataset.informationId
  axios.get(`/informations/${informationId}/bookmark`)
    .then((response) => {
      const hasBookmark = response.data.hasBookmark
      handleBookmarkDisplay(hasBookmark)
    })

  $('.inactive-bookmark').on('click', () => {
    axios.post(`/informations/${informationId}/bookmark`)
      .then((response) => {
        if (response.data.status === 'ok') {
          $('.active-bookmark').removeClass('hidden')
          $('.inactive-bookmark').addClass('hidden')
        }
      })
      .catch((e) => {
        window.alert('Error')
        console.log(e)
      })
  })

  $('.active-bookmark').on('click', () => {
    axios.delete(`/informations/${informationId}/bookmark`)
      .then((response) => {
        if (response.data.status === 'ok') {
          $('.active-bookmark').addClass('hidden')
          $('.inactive-bookmark').removeClass('hidden')
        }
      })
      .catch((e) => {
        window.alert('Error')
        console.log(e)
      })
  })
})
