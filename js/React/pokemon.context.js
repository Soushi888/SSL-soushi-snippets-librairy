import react from "react";
import {createContext, useState} from "react";

export const PokemonContext = createContext({});

function PokemonProvider({children}) {
  let [pokemons, setPokemons] = useState([])

  const getPokemons = async () => {
    let request = await fetch("https://pokeapi.co/api/v2/pokemon");
    let result = await request.json();

    setPokemons(result.results)
  }

  const getPokemon = async (url) => {
    let request = await fetch(url);
    return await request.json();
  }

  return <PokemonContext.Provider value={{pokemons, getPokemons, getPokemon}}>{children}</PokemonContext.Provider>;
}

export default PokemonProvider;
