import { nominate } from './nominate.js'


const results = document.querySelector("#results");
const searchBar = document.querySelector("#searchBar");

const callAPI = () => {
  searchBar.addEventListener('keyup', (event) => {
    fetch(`http://www.omdbapi.com/?s=${event.currentTarget.value}&apikey=adf1f2d7`)
      .then(response => response.json())
      .then((data) => {
        if (data.Response == "True") {
          results.innerHTML = "";
          data.Search.forEach((result) => {
            if (result.Type == 'movie') {
              const movie = `<li class="list-inline-item">
                <img src="${result.Poster}" alt="">
                <span>${result.Year}</span>
                <p>${result.Title}</p>
                <a rel="nofollow" data-method="post" href="/nominations?imdbID=${result.imdbID}">
                  <i class="fas fa-vote-yea nominate"></i>
                </a>
              </li>`;
              results.insertAdjacentHTML("beforeend", movie);
            }
          });
          nominate();
        }
      });
})}

export { callAPI };