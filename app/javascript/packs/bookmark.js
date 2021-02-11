import $ from 'jquery'
import axios from 'axios'

document.addEventListener('DOMContentLoaded', () => {
  const dataset = $('#information-show').data()
  const informationId = dataset.informationId
  axios.get(`/informations/${informationId}/bookmark`)
    .then((response) => {
      console.log(response)
    })
})
