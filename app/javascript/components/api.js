const results = document.querySelector("#results");
const searchBar = document.querySelector("#searchBar");

const callAPI = () => {
  if (searchBar) {
    searchBar.addEventListener('keyup', (event) => {
      fetch(`http://www.omdbapi.com/?s=${event.currentTarget.value}&apikey=adf1f2d7`)
        .then(response => response.json())
        .then((data) => {
          if (data.Error == "Incorrect IMDb ID.") {
            results.innerHTML = ""; }
          else if (data.Response == "True") {
            results.innerHTML = "";
            data.Search.forEach((result) => {
              if (result.Type == 'movie') {
                const movie = `<li class="list-inline-item">
                  <img src="${result.Poster}" alt="">
                  <span>${result.Year}</span>
                  <p>${result.Title}</p>
                  <form action="/nominations?imdbID=${result.imdbID}" method="post">
                    <button name="nominate" value="nom" id="${result.imdbID}"><i class="fas fa-vote-yea nominate"></i></button>
                  </form>
                </li>`;
                // event.preventDefault();
                // const button = document.querySelector("#searchBar");
                results.insertAdjacentHTML("beforeend", movie);
              }
            });
          }
        });
    })
  }
}

export { callAPI };
