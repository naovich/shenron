import { ProjetAction } from "./projetActions";
import { ProjetState } from "./ProjetContext";

export const initialProjetState: ProjetState = {
  projets: [],
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
    default:
      return state;
  }
};
