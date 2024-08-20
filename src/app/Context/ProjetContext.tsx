"use client";

import React, {
  createContext,
  useContext,
  useReducer,
  ReactNode,
  Dispatch,
} from "react";
import { ProjetProps, AppProps } from "@/lib/types";

//------------------- REDUCER -------------------

export type ProjetState = {
  projets: ProjetProps[];
};

export type ProjetAction =
  | { type: "ADD_PROJET"; payload: ProjetProps }
  | { type: "UPDATE_PROJET"; payload: ProjetProps }
  | { type: "DELETE_PROJET"; payload: string }
  | { type: "ADD_APP"; payload: { projectTitle: string; app: AppProps } }
  | { type: "UPDATE_APP"; payload: { projectTitle: string; app: AppProps } }
  | { type: "DELETE_APP"; payload: { projectTitle: string; appTitle: string } };

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
          projet.title === action.payload.title ? action.payload : projet
        ),
      };
    case "DELETE_PROJET":
      return {
        ...state,
        projets: state.projets.filter(
          (projet) => projet.title !== action.payload
        ),
      };
    case "ADD_APP":
      return {
        ...state,
        projets: state.projets.map((projet) =>
          projet.title === action.payload.projectTitle
            ? { ...projet, apps: [...projet.apps, action.payload.app] }
            : projet
        ),
      };
    case "UPDATE_APP":
      return {
        ...state,
        projets: state.projets.map((projet) =>
          projet.title === action.payload.projectTitle
            ? {
                ...projet,
                apps: projet.apps.map((app) =>
                  app.title === action.payload.app.title
                    ? action.payload.app
                    : app
                ),
              }
            : projet
        ),
      };
    case "DELETE_APP":
      return {
        ...state,
        projets: state.projets.map((projet) =>
          projet.title === action.payload.projectTitle
            ? {
                ...projet,
                apps: projet.apps.filter(
                  (app) => app.title !== action.payload.appTitle
                ),
              }
            : projet
        ),
      };
    default:
      return state;
  }
};

//------------------- CONTEXT -------------------

type ProjetContextType = {
  state: ProjetState;
  dispatch: Dispatch<ProjetAction>;
  addApp: (projectTitle: string, app: AppProps) => void;
  updateApp: (projectTitle: string, app: AppProps) => void;
  deleteApp: (projectTitle: string, appTitle: string) => void;
};

const ProjetContext = createContext<ProjetContextType | undefined>(undefined);

export const ProjetProvider: React.FC<{ children: ReactNode }> = ({
  children,
}) => {
  const [state, dispatch] = useReducer(projetReducer, initialProjetState);

  const addApp = (projectTitle: string, app: AppProps) => {
    dispatch({ type: "ADD_APP", payload: { projectTitle, app } });
  };

  const updateApp = (projectTitle: string, app: AppProps) => {
    dispatch({ type: "UPDATE_APP", payload: { projectTitle, app } });
  };

  const deleteApp = (projectTitle: string, appTitle: string) => {
    dispatch({ type: "DELETE_APP", payload: { projectTitle, appTitle } });
  };

  return (
    <ProjetContext.Provider
      value={{ state, dispatch, addApp, updateApp, deleteApp }}
    >
      {children}
    </ProjetContext.Provider>
  );
};

export const useProjetState = () => {
  const context = useContext(ProjetContext);
  if (!context) {
    throw new Error("useProjetState must be used within a ProjetProvider");
  }
  return context;
};
