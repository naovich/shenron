import { AppProps } from "@/lib/types";
import { AppAction } from "./appActions";

export interface AppState {
  apps: {
    [projectId: string]: AppProps[];
  };
  selectedApp: { projectId: string; appId: string } | null;
}

export const initialAppState: AppState = {
  apps: {},
  selectedApp: null,
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
    case "ADD_PAGE_TO_APP":
      return {
        ...state,
        apps: {
          ...state.apps,
          [action.payload.projectId]: state.apps[action.payload.projectId].map(
            (app) =>
              app.id === action.payload.appId
                ? { ...app, pages: [...(app.pages || []), action.payload.page] }
                : app
          ),
        },
      };
    case "UPDATE_PAGE_IN_APP":
      return {
        ...state,
        apps: {
          ...state.apps,
          [action.payload.projectId]: state.apps[action.payload.projectId].map(
            (app) =>
              app.id === action.payload.appId
                ? {
                    ...app,
                    pages: app.pages.map((page) =>
                      page.id === action.payload.page.id
                        ? action.payload.page
                        : page
                    ),
                  }
                : app
          ),
        },
      };
    case "DELETE_PAGE_FROM_APP":
      return {
        ...state,
        apps: {
          ...state.apps,
          [action.payload.projectId]: state.apps[action.payload.projectId].map(
            (app) =>
              app.id === action.payload.appId
                ? {
                    ...app,
                    pages: app.pages.filter(
                      (page) => page.id !== action.payload.pageId
                    ),
                  }
                : app
          ),
        },
      };
    case "SELECT_APP":
      return {
        ...state,
        selectedApp: {
          projectId: action.payload.projectId,
          appId: action.payload.appId,
        },
      };
    default:
      return state;
  }
};
