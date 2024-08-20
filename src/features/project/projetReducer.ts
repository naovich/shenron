import { ProjetAction } from "./projetActions";
import { ProjetState } from "./ProjetContext";

export const initialProjetState: ProjetState = {
  projets: [],
  selectedProjet: null,
};

export const projetReducer = (
  state: ProjetState,
  action: ProjetAction
): ProjetState => {
  switch (action.type) {
    case "ADD_PROJET":
      return {
        ...state,
        projets: [...state.projets, action.payload],
        selectedProjet: action.payload,
      };
    case "UPDATE_PROJET":
      return {
        ...state,
        projets: state.projets.map((projet) =>
          projet.id === action.payload.id ? action.payload : projet
        ),
      };
    case "DELETE_PROJET":
      return {
        ...state,
        projets: state.projets.filter((projet) => projet.id !== action.payload),
      };

    case "SELECT_PROJET":
      return {
        ...state,
        selectedProjet:
          state.projets.find((projet) => projet.id === action.payload) || null,
      };
    default:
      return state;
  }
};
