import "./App.css";

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <img src="logo.png" className="App-logo" alt="logo" />
        <p>Welcome to My GKE / CircleCI / Playground</p>
        <p>
          <ul>
            <li>
              <a
                className="App-link"
                href="https://www.linkedin.com/in/leonardo-cuquejo-875a9721"
                target="_blank"
                rel="noopener noreferrer"
              >
                My Linkedin page!
              </a>
            </li>
            <li>
              <a
                className="App-link"
                href="https://github.com/lcuquejo"
                target="_blank"
                rel="noopener noreferrer"
              >
                My GitHub :)
              </a>
            </li>
            <li>
              <a
                className="App-link"
                href="https://coinagio.com/"
                target="_blank"
                rel="noopener noreferrer"
              >
                Crypto Agio (BRL/EUR/USD)
              </a>
            </li>
          </ul>
        </p>
      </header>
    </div>
  );
}

export default App;
