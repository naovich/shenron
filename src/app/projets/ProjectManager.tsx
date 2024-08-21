"use client";
import React, { useState, ChangeEvent, useEffect } from "react";
import { useProjet } from "@/features/project/useProjet";
import { useApp } from "@/features/app/useApp";
import {
  AppProps,
  ProjetProps,
  DeviceProps,
  PageProps,
  PageRoleProps,
} from "@/lib/types";
import {
  Card,
  CardContent,
  CardFooter,
  CardHeader,
} from "@/components/ui/card";
import { Input } from "@/components/ui/input";
import { Button } from "@/components/ui/button";
import {
  Select,
  SelectTrigger,
  SelectValue,
  SelectContent,
  SelectItem,
} from "@/components/ui/select";

const ProjectManager = () => {
  const { projets, addProjet, deleteProjet, getSelectedProjet, selectProjet } =
    useProjet();
  const {
    getAppsForProject,
    addApp,
    updateApp,
    deleteApp,
    selectApp,
    getSelectedApp,
    addPage,
    updatePage,
    deletePage,
    getPagesForApp,
  } = useApp();

  const [newProjet, setNewProjet] = useState<Partial<ProjetProps>>({
    title: "",
    description: "",
  });

  const selectedProjet = getSelectedProjet();
  const currentProjectId = selectedProjet ? selectedProjet.id : "";
  const [selectedProjectId, setSelectedProjectId] =
    useState<string>(currentProjectId);

  const [newApp, setNewApp] = useState<Partial<AppProps>>({
    title: "",
    description: "",
    device: "web",
  });

  const selectedApp = getSelectedApp();

  const [newPage, setNewPage] = useState<Partial<PageProps>>({
    title: "",
    role: "home",
  });

  useEffect(() => {
    if (selectedProjet) {
      setSelectedProjectId(selectedProjet.id);
    }
  }, [selectedProjet]);

  const handleProjetInputChange = (name: keyof ProjetProps, value: string) => {
    setNewProjet((prev) => ({ ...prev, [name]: value }));
  };

  const handleAddProjet = () => {
    if (newProjet.title && newProjet.description) {
      addProjet({
        ...newProjet,
        image: "",
        tags: [],
      } as ProjetProps);
      setNewProjet({ title: "", description: "" });
    }
  };

  const handleProjectChange = (projectId: string) => {
    setSelectedProjectId(projectId);
    selectProjet(projectId);
  };

  const handleAppInputChange = (name: keyof AppProps, value: string) => {
    setNewApp((prev) => ({ ...prev, [name]: value }));
  };

  const handleAddApp = () => {
    if (selectedProjectId && newApp.title && newApp.description) {
      addApp(selectedProjectId, {
        ...newApp,
        mainApp: false,
        image: "",
        tags: [],
        pages: [],
      } as AppProps);
      setNewApp({ title: "", description: "", device: "web" });
    }
  };

  const handleUpdateApp = () => {
    if (selectedProjectId && selectedApp) {
      updateApp(selectedProjectId, {
        ...selectedApp,
        title: newApp.title || selectedApp.title,
        description: newApp.description || selectedApp.description,
        device: newApp.device || selectedApp.device,
      });
      setNewApp({ title: "", description: "", device: "web" });
    }
  };

  const handleDeleteApp = () => {
    if (selectedProjectId && selectedApp) {
      deleteApp(selectedProjectId, selectedApp.id);
      selectApp(selectedProjectId, ""); // Désélectionner l'app après suppression
      setNewApp({ title: "", description: "", device: "web" });
    }
  };

  const handleAppChange = (appId: string) => {
    if (selectedProjectId) {
      selectApp(selectedProjectId, appId);
    }
  };

  const handleAddPage = () => {
    if (selectedProjectId && selectedApp && newPage.title) {
      addPage(selectedProjectId, selectedApp.id, {
        ...newPage,
        id: "",
        type: "page",
        index: false,
        head: {
          title: newPage.title,
          description: "",
          keywords: [],
        },
        image: "",
        blocks: [],
      } as PageProps);
      setNewPage({ title: "", role: "home" });
    }
  };

  return (
    <div className="p-6 max-w-4xl mx-auto">
      <h1 className="text-3xl font-bold mb-6">Gestion des Projets et Apps</h1>
      <h2 className="text-2xl font-bold mb-6">
        Projet sélectionné: {selectedProjet?.title}
      </h2>

      <Card className="mb-8">
        <CardHeader>
          <h2 className="text-2xl font-semibold">Gestion des projets</h2>
        </CardHeader>
        <CardContent>
          <Select value={selectedProjectId} onValueChange={handleProjectChange}>
            <SelectTrigger className="mb-4">
              <SelectValue placeholder="Sélectionner un projet" />
            </SelectTrigger>
            <SelectContent>
              {projets.map((project) => (
                <SelectItem key={project.id} value={project.id}>
                  {project.title}
                </SelectItem>
              ))}
            </SelectContent>
          </Select>
          <Input
            className="mb-4"
            value={newProjet.title}
            onChange={(e: ChangeEvent<HTMLInputElement>) =>
              handleProjetInputChange("title", e.target.value)
            }
            placeholder="Titre du nouveau projet"
          />
          <Input
            className="mb-4"
            value={newProjet.description}
            onChange={(e: ChangeEvent<HTMLInputElement>) =>
              handleProjetInputChange("description", e.target.value)
            }
            placeholder="Description du nouveau projet"
          />
        </CardContent>
        <CardFooter>
          <Button onClick={handleAddProjet} className="mr-2">
            Ajouter Projet
          </Button>
          {selectedProjectId && (
            <Button
              onClick={() => deleteProjet(selectedProjectId)}
              variant="destructive"
            >
              Supprimer Projet
            </Button>
          )}
        </CardFooter>
      </Card>

      {selectedProjectId && (
        <Card className="mb-8">
          <CardHeader>
            <h2 className="text-2xl font-semibold">Gérer les Apps</h2>
          </CardHeader>
          <CardContent>
            <Select
              value={selectedApp?.id || ""}
              onValueChange={handleAppChange}
            >
              <SelectTrigger className="mb-4">
                <SelectValue placeholder="Sélectionner une App" />
              </SelectTrigger>
              <SelectContent>
                {getAppsForProject(selectedProjectId).map((app) => (
                  <SelectItem key={app.id} value={app.id}>
                    {app.title}
                  </SelectItem>
                ))}
              </SelectContent>
            </Select>
            <Input
              className="mb-4"
              value={newApp.title || ""}
              onChange={(e: ChangeEvent<HTMLInputElement>) =>
                handleAppInputChange("title", e.target.value)
              }
              placeholder="Titre de l'app"
            />
            <Input
              className="mb-4"
              value={newApp.description || ""}
              onChange={(e: ChangeEvent<HTMLInputElement>) =>
                handleAppInputChange("description", e.target.value)
              }
              placeholder="Description de l'app"
            />
            <Select
              value={newApp.device || "web"}
              onValueChange={(value) =>
                handleAppInputChange("device", value as DeviceProps)
              }
            >
              <SelectTrigger className="mb-4">
                <SelectValue placeholder="Sélectionnez un appareil" />
              </SelectTrigger>
              <SelectContent>
                <SelectItem value="web">Web</SelectItem>
                <SelectItem value="mobile">Mobile</SelectItem>
                <SelectItem value="desktop">Desktop</SelectItem>
              </SelectContent>
            </Select>
          </CardContent>
          <CardFooter>
            <Button onClick={handleAddApp} className="mr-2">
              Ajouter App
            </Button>
            {selectedApp && (
              <>
                <Button onClick={handleUpdateApp} className="mr-2">
                  Mettre à jour App
                </Button>
                <Button onClick={handleDeleteApp} variant="destructive">
                  Supprimer App
                </Button>
              </>
            )}
          </CardFooter>
        </Card>
      )}

      {selectedApp && (
        <Card className="mb-8">
          <CardHeader>
            <h2 className="text-2xl font-semibold">
              Gérer les Pages pour {selectedApp.title}
            </h2>
          </CardHeader>
          <CardContent>
            <Input
              className="mb-4"
              value={newPage.title || ""}
              onChange={(e: ChangeEvent<HTMLInputElement>) =>
                setNewPage({ ...newPage, title: e.target.value })
              }
              placeholder="Titre de la page"
            />
            <Select
              value={newPage.role || "home"}
              onValueChange={(value) =>
                setNewPage({ ...newPage, role: value as PageRoleProps })
              }
            >
              <SelectTrigger className="mb-4">
                <SelectValue placeholder="Sélectionnez un rôle" />
              </SelectTrigger>
              <SelectContent>
                <SelectItem value="home">Home</SelectItem>
                <SelectItem value="about">About</SelectItem>
                <SelectItem value="contact">Contact</SelectItem>
                {/* Ajoutez d'autres rôles selon vos besoins */}
              </SelectContent>
            </Select>
          </CardContent>
          <CardFooter>
            <Button onClick={handleAddPage}>Ajouter Page</Button>
          </CardFooter>
        </Card>
      )}

      {selectedApp && (
        <Card>
          <CardHeader>
            <h2 className="text-2xl font-semibold">
              Pages de l'app {selectedApp.title}
            </h2>
          </CardHeader>
          <CardContent>
            {getPagesForApp(selectedProjectId, selectedApp.id).map((page) => (
              <div key={page.id} className="mb-4 p-4 border rounded">
                <h5 className="text-lg font-semibold">{page.title}</h5>
                <p>Role: {page.role}</p>
                <Button
                  onClick={() =>
                    deletePage(selectedProjectId, selectedApp.id, page.id)
                  }
                  className="mt-2"
                  variant="destructive"
                >
                  Supprimer Page
                </Button>
              </div>
            ))}
          </CardContent>
        </Card>
      )}
    </div>
  );
};

export default ProjectManager;
