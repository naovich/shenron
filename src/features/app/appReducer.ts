import { AppProps } from "@/lib/types";
import { AppAction } from "./appActions";

export interface AppState {
  apps: {
    [projectId: string]: AppProps[];
  };
}

export const initialAppState: AppState = {
  apps: {},
};

export const appReducer = (state: AppState, action: AppAction): AppState => {
  switch (action.type) {
    case "ADD_APP":
      return {
        ...state,
        apps: {
          ...state.apps,
          [action.payload.projectId]: [
            ...(state.apps[action.payload.projectId] || []),
            action.payload.app,
          ],
        },
      };
    case "UPDATE_APP":
      return {
        ...state,
        apps: {
          ...state.apps,
          [action.payload.projectId]: state.apps[action.payload.projectId].map(
            (app) =>
              app.id === action.payload.app.id ? action.payload.app : app
          ),
        },
      };
    case "DELETE_APP":
      return {
        ...state,
        apps: {
          ...state.apps,
          [action.payload.projectId]: state.apps[
            action.payload.projectId
          ].filter((app) => app.id !== action.payload.appId),
        },
      };
    default:
      return state;
  }
};
