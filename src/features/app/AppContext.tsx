"use client";
import React, { createContext, useReducer, ReactNode } from "react";
import { appReducer, initialAppState } from "./appReducer";
import { AppAction } from "./appActions";
import { AppState } from "./appReducer";

type AppContextType = {
  state: AppState;
  dispatch: React.Dispatch<AppAction>;
};

export const AppContext = createContext<AppContextType | undefined>(undefined);

export const AppProvider: React.FC<{ children: ReactNode }> = ({
  children,
}) => {
  const [state, dispatch] = useReducer(appReducer, initialAppState);

  return (
    <AppContext.Provider value={{ state, dispatch }}>
      {children}
    </AppContext.Provider>
  );
};
