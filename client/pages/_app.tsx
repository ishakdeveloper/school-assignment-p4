import React from 'react';
import Head from 'next/head';
import '../styles/globals.css'

function MyApp({ Component, pageProps }) {
  React.useEffect(() => {
    // Serverside styles weghalen
    const jssStyles = document.querySelector('#jss-server-side');
    if (jssStyles) {
      jssStyles.parentElement.removeChild(jssStyles);
    }
  }, []);

  return (
    <React.Fragment>
      <Head>
        <title>App</title>
        <meta name="viewport" content="minimum-scale=1, initial-scale=1, width=device-width" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" />
      </Head>
      <Component {...pageProps} />
    </React.Fragment>
  ) 
}

export default MyApp
