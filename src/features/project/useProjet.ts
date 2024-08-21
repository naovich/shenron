import { useContext } from "react";
import { ProjetContext } from "./ProjetContext";
import {
  addProjet,
  updateProjet,
  deleteProjet,
  selectProjet,
} from "./projetActions";
import { ProjetProps } from "@/lib/types";

export const useProjet = () => {
  const context = useContext(ProjetContext);

  if (context === undefined) {
    throw new Error("useProjet must be used within a ProjetProvider");
  }

  const { state, dispatch } = context;

  return {
    projets: state.projets,
    addProjet: (projet: ProjetProps) => dispatch(addProjet(projet)),
    updateProjet: (projet: ProjetProps) => dispatch(updateProjet(projet)),
    deleteProjet: (projetId: string) => dispatch(deleteProjet(projetId)),
    selectProjet: (projetId: string) => dispatch(selectProjet(projetId)),
    getSelectedProjet: () => state.selectedProjet,
    getProjetById: (projetId: string) =>
      state.projets.find((p) => p.id === projetId),
  };
};
