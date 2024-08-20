"use client";

import React, { createContext, useReducer, ReactNode } from "react";
import { pageReducer, initialPageState, PageState } from "./pageReducer";
import { PageAction } from "./pageActions";

type PageContextType = {
  state: PageState;
  dispatch: React.Dispatch<PageAction>;
};

export const PageContext = createContext<PageContextType | undefined>(
  undefined
);

export const PageProvider: React.FC<{ children: ReactNode }> = ({
  children,
}) => {
  const [state, dispatch] = useReducer(pageReducer, initialPageState);

  return (
    <PageContext.Provider value={{ state, dispatch }}>
      {children}
    </PageContext.Provider>
  );
};
