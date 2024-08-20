import { useState } from "react";
import { useProjetState } from "../Context/ProjetContext";
import { AppProps, ProjetProps } from "@/lib/types";

export const useAddProject = () => {
  const { dispatch } = useProjetState();
  const [newProjet, setNewProjet] = useState<Partial<ProjetProps>>({
    title: "",
    description: "",
    dateOfCreation: Date.now(),
    lastUpdate: Date.now(),
    image: "",
    tags: [],
    apps: [],
  });

  const handleInputChange = (name: keyof ProjetProps, value: any) => {
    setNewProjet((prev) => ({
      ...prev,
      [name]: value,
    }));
  };

  const handleAddProjet = () => {
    dispatch({ type: "ADD_PROJET", payload: newProjet as ProjetProps });
    setNewProjet({
      title: "",
      description: "",
      dateOfCreation: Date.now(),
      lastUpdate: Date.now(),
      image: "",
      tags: [],
      apps: [],
    });
  };

  return {
    newProjet,
    handleInputChange,
    handleAddProjet,
  };
};

//-----APP HOOKS-----

export const useAppManagement = () => {
  const { state, dispatch, addApp, updateApp, deleteApp } = useProjetState();
  const [selectedProjectTitle, setSelectedProjectTitle] = useState<string>("");
  const [newApp, setNewApp] = useState<Partial<AppProps>>({
    title: "",
    description: "",
    mainApp: false,
    dateOfCreation: Date.now(),
    lastUpdate: Date.now(),
    device: "web",
    image: "",
    tags: [],
    pages: [],
  });

  const handleAppInputChange = (name: keyof AppProps, value: any) => {
    setNewApp((prev) => ({
      ...prev,
      [name]: value,
    }));
  };

  const handleAddApp = () => {
    if (selectedProjectTitle) {
      addApp(selectedProjectTitle, newApp as AppProps);
      setNewApp({
        title: "",
        description: "",
        mainApp: false,
        dateOfCreation: Date.now(),
        lastUpdate: Date.now(),
        device: "web",
        image: "",
        tags: [],
        pages: [],
      });
    }
  };

  const handleUpdateApp = (projectTitle: string, app: AppProps) => {
    updateApp(projectTitle, app);
  };

  const handleDeleteApp = (projectTitle: string, appTitle: string) => {
    deleteApp(projectTitle, appTitle);
  };

  const handleDeleteProject = (projectTitle: string) => {
    dispatch({ type: "DELETE_PROJET", payload: projectTitle });
    if (selectedProjectTitle === projectTitle) {
      setSelectedProjectTitle("");
    }
  };

  return {
    projects: state.projets,
    selectedProjectTitle,
    setSelectedProjectTitle,
    newApp,
    handleAppInputChange,
    handleAddApp,
    handleUpdateApp,
    handleDeleteApp,
    handleDeleteProject,
  };
};
