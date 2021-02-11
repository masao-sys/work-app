import $ from 'jquery'
import axios from 'axios'

document.addEventListener('DOMContentLoaded', () => {
  const dataset = $('#information-show').data()
  const informationId = dataset.informationId
  axios.get(`/informations/${informationId}/bookmark`)
    .then((response) => {
      const hasBookmark = response.data.hasBookmark
      if (hasBookmark) {
        $('.active-bookmark').removeClass('hidden')
      } else {
        $('.inactive-bookmark').removeClass('hidden')
      }
    })
})
