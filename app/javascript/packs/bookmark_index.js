import $ from 'jquery'
import axios from 'axios'
import { csrfToken } from 'rails-ujs'

axios.defaults.headers.common['X-CSRF-Token'] = csrfToken()

document.addEventListener('DOMContentLoaded', () => {

  $('.inactive-bookmark').on('click', (e) => {
    e.preventDefault();
    const id = $(e.currentTarget).attr('id') //クリックしたdivのid取得
    axios.post(`/informations/${id}/bookmark`)
      .then((response) => {
        if (response.data.status === 'ok') {
          $(`.active-bookmark.${id}`).removeClass('hidden')
          $(`.inactive-bookmark.${id}`).addClass('hidden')
        }
      })
      .catch((e) => {
        window.alert('Error')
        console.log(e)
      })
  })

  $('.active-bookmark').on('click', (e) => {
    e.preventDefault();
    const id = $(e.currentTarget).attr('id') //クリックしたdivのid取得
    axios.delete(`/informations/${id}/bookmark`)
      .then((response) => {
        if (response.data.status === 'ok') {
          $(`.active-bookmark.${id}`).addClass('hidden')
          $(`.inactive-bookmark.${id}`).removeClass('hidden')
        }
      })
      .catch((e) => {
        window.alert('Error')
        console.log(e)
      })
  })
})
