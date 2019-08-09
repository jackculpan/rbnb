import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('search_query');
  if (addressInput) {
    places({ container: addressInput });
  }
};

const initAutocompleteForPool = () => {
  const poolInput = document.getElementById('pool_location');
  if (poolInput) {
    places({
      container: poolInput,
      appId: process.env.ALGOLIA_APP,
      apiKey: process.env.ALGOLIA_KEY,
    });
  }
};


export { initAutocompleteForPool };
export { initAutocomplete };
