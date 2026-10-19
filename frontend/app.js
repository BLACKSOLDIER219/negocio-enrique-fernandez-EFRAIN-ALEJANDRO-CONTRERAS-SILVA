const form = document.querySelector("#search-form");
const input = document.querySelector("#pokemon-name");
const button = document.querySelector("#search-button");
const status = document.querySelector("#status");
const result = document.querySelector("#result");

form.addEventListener("submit", async (event) => {
  event.preventDefault();

  const pokemonName = input.value.trim().toLowerCase();
  if (!pokemonName) {
    showError("Escribe el nombre o número de un Pokémon.");
    return;
  }

  result.replaceChildren();
  status.className = "loading";
  status.textContent = "Cargando información...";
  button.disabled = true;

  try {
    const response = await fetch(
      `https://pokeapi.co/api/v2/pokemon/${encodeURIComponent(pokemonName)}`
    );

    if (!response.ok) {
      if (response.status === 404) {
        throw new Error("No encontramos ese Pokémon. Revisa el nombre e inténtalo otra vez.");
      }
      throw new Error(`La API respondió con el estado HTTP ${response.status}.`);
    }

    const pokemon = await response.json();
    showPokemon(pokemon);
    status.className = "";
    status.textContent = "Consulta completada correctamente.";
  } catch (error) {
    showError(
      error instanceof TypeError
        ? "No se pudo conectar con PokeAPI. Comprueba tu conexión a Internet e inténtalo de nuevo."
        : error.message || "Ocurrió un error inesperado."
    );
  } finally {
    button.disabled = false;
  }
});

function showError(message) {
  result.replaceChildren();
  status.className = "error";
  status.textContent = message;
}

function showPokemon(pokemon) {
  const section = document.createElement("article");
  section.className = "pokemon";

  const title = document.createElement("h2");
  title.textContent = capitalize(pokemon.name);

  const image = document.createElement("img");
  image.src = pokemon.sprites.other?.["official-artwork"]?.front_default
    || pokemon.sprites.front_default
    || "";
  image.alt = `Imagen de ${pokemon.name}`;
  image.width = 190;
  image.height = 190;

  const types = document.createElement("div");
  types.className = "types";
  pokemon.types.forEach(({ type }) => {
    const tag = document.createElement("span");
    tag.className = "type";
    tag.textContent = capitalize(type.name);
    types.append(tag);
  });

  const details = document.createElement("dl");
  details.append(
    makeDetail("Peso", `${(pokemon.weight / 10).toFixed(1)} kg`),
    makeDetail("Altura", `${(pokemon.height / 10).toFixed(1)} m`),
    makeDetail("Número", `#${pokemon.id}`)
  );

  section.append(title, image, types, details);
  result.replaceChildren(section);
}

function makeDetail(label, value) {
  const wrapper = document.createElement("div");
  const term = document.createElement("dt");
  const description = document.createElement("dd");
  term.textContent = label;
  description.textContent = value;
  wrapper.append(term, description);
  return wrapper;
}

function capitalize(value) {
  return value.charAt(0).toUpperCase() + value.slice(1);
}
