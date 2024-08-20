"use client";

import React, { createContext, useReducer, ReactNode } from "react";
import { projetReducer, initialProjetState } from "./projetReducer";
import { ProjetAction } from "./projetActions";
import { ProjetProps } from "@/lib/types";

export type ProjetState = {
  projets: ProjetProps[];
};

type ProjetContextType = {
  state: ProjetState;
  dispatch: React.Dispatch<ProjetAction>;
};

export const ProjetContext = createContext<ProjetContextType | undefined>(
  undefined
);

export const ProjetProvider: React.FC<{ children: ReactNode }> = ({
  children,
}) => {
  const [state, dispatch] = useReducer(projetReducer, initialProjetState);

  return (
    <ProjetContext.Provider value={{ state, dispatch }}>
      {children}
    </ProjetContext.Provider>
  );
};
