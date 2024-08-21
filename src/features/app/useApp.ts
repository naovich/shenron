import { useContext } from "react";
import { AppContext } from "./AppContext";
import {
  addApp,
  updateApp,
  deleteApp,
  addPageToApp,
  updatePageInApp,
  deletePageFromApp,
  selectApp,
} from "./appActions";
import { useProjet } from "../project/useProjet";
import { AppProps, PageProps } from "@/lib/types";

export const useApp = () => {
  const context = useContext(AppContext);

  if (context === undefined) {
    throw new Error("useApp must be used within an AppProvider");
  }

  const { state, dispatch } = context;
  const { getProjetById } = useProjet();

  return {
    getAppsForProject: (projectId: string) => state.apps[projectId] || [],
    addApp: (projectId: string, app: AppProps) => {
      const projet = getProjetById(projectId);
      if (projet) {
        dispatch(addApp(projectId, app));
      } else {
        console.error("Cannot add app: Project not found");
      }
    },
    updateApp: (projectId: string, app: AppProps) => {
      if (state.apps[projectId]) {
        dispatch(updateApp(projectId, app));
      } else {
        console.error("Cannot update app: Project or app not found");
      }
    },
    deleteApp: (projectId: string, appId: string) => {
      if (state.apps[projectId]) {
        dispatch(deleteApp(projectId, appId));
      } else {
        console.error("Cannot delete app: Project or app not found");
      }
    },
    getAppById: (projectId: string, appId: string) =>
      state.apps[projectId]?.find((app: AppProps) => app.id === appId),
    addPage: (projectId: string, appId: string, page: PageProps) => {
      if (state.apps[projectId]) {
        dispatch(addPageToApp(projectId, appId, page));
      } else {
        console.error("Cannot add page: Project or app not found");
      }
    },
    updatePage: (projectId: string, appId: string, page: PageProps) => {
      if (state.apps[projectId]) {
        dispatch(updatePageInApp(projectId, appId, page));
      } else {
        console.error("Cannot update page: Project or app not found");
      }
    },
    deletePage: (projectId: string, appId: string, pageId: string) => {
      if (state.apps[projectId]) {
        dispatch(deletePageFromApp(projectId, appId, pageId));
      } else {
        console.error("Cannot delete page: Project or app not found");
      }
    },
    getPagesForApp: (projectId: string, appId: string) =>
      state.apps[projectId]?.find((app: AppProps) => app.id === appId)?.pages ||
      [],

    selectApp: (projectId: string, appId: string) => {
      dispatch(selectApp(projectId, appId));
    },
    getSelectedApp: () => {
      if (state.selectedApp) {
        const { projectId, appId } = state.selectedApp;
        return state.apps[projectId]?.find((app) => app.id === appId) || null;
      }
      return null;
    },
  };
};
