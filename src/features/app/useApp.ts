import { useContext } from "react";
import { AppContext } from "./AppContext";
import { addApp, updateApp, deleteApp } from "./appActions";
import { useProjet } from "../project/useProjet";
import { AppProps } from "@/lib/types";

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
        console.log(projectId);
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
  };
};
