import { ProjetProps } from "@/lib/types";

export const addProjet = (projet: ProjetProps) => ({
  type: "ADD_PROJET" as const,
  payload: {
    ...projet,
    dateOfCreation: Date.now(),
    lastUpdate: Date.now(),
    id: `project-${Date.now().toString()}`,
  },
});

export const updateProjet = (projet: ProjetProps) => ({
  type: "UPDATE_PROJET" as const,
  payload: projet,
});

export const deleteProjet = (projetId: string) => ({
  type: "DELETE_PROJET" as const,
  payload: projetId,
});

export const selectProjet = (projetId: string) => ({
  type: "SELECT_PROJET" as const,
  payload: projetId,
});

export type ProjetAction =
  | ReturnType<typeof addProjet>
  | ReturnType<typeof updateProjet>
  | ReturnType<typeof deleteProjet>
  | ReturnType<typeof selectProjet>;
