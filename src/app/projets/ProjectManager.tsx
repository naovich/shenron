"use client";
import React, { useState, ChangeEvent, useEffect } from "react";
import { useProjet } from "@/features/project/useProjet";
import { useApp } from "@/features/app/useApp";
import { AppProps, ProjetProps, DeviceProps } from "@/lib/types";
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
  const { getAppsForProject, addApp, updateApp, deleteApp } = useApp();

  const [newProjet, setNewProjet] = useState<Partial<ProjetProps>>({
    title: "",
    description: "",
  });

  const selectedProjet = getSelectedProjet();
  const currentProjectId = selectedProjet ? selectedProjet.id : "";
  const [selectedProjectId, setSelectedProjectId] =
    useState<string>(currentProjectId);

  useEffect(() => {
    if (selectedProjet) {
      setSelectedProjectId(selectedProjet.id);
    }
  }, [selectedProjet]);

  const [newApp, setNewApp] = useState<Partial<AppProps>>({
    title: "",
    description: "",
    device: "web",
  });
  const [selectedApp, setSelectedApp] = useState<AppProps | null>(null);

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
      });
      setSelectedApp(null);
    }
  };

  return (
    <div className="p-6 max-w-4xl mx-auto">
      <h1 className="text-3xl font-bold mb-6">Gestion des Projets et Apps</h1>
      <h1 className="text-3xl font-bold mb-6">
        SelectedProjet: {selectedProjet?.title}
      </h1>

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

      <Card className="mb-8">
        <CardHeader>
          <h2 className="text-2xl font-semibold">Gérer les Apps</h2>
        </CardHeader>
        <CardContent>
          {selectedProjectId && (
            <>
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
            </>
          )}
        </CardContent>
        <CardFooter>
          <Button onClick={handleAddApp} disabled={!selectedProjectId}>
            Ajouter App
          </Button>
        </CardFooter>
      </Card>

      <Card>
        <CardHeader>
          <h2 className="text-2xl font-semibold">Liste des Projets et Apps</h2>
        </CardHeader>
        <CardContent>
          {projets.map((project) => (
            <div key={project.id} className="mb-6">
              <h3 className="text-xl font-semibold mb-2">{project.title}</h3>
              <p className="mb-2">{project.description}</p>
              <h4 className="text-lg font-semibold mb-2">Apps:</h4>
              {getAppsForProject(project.id).map((app) => (
                <div key={app.id} className="ml-4 mb-2">
                  <h5 className="text-md font-semibold">{app.title}</h5>
                  <p>{app.description}</p>
                  <p>Device: {app.device}</p>
                  <p>Id: {app.id}</p>
                  <p>
                    Créé le :{" "}
                    {new Date(app.dateOfCreation).toLocaleDateString()}
                  </p>
                  <p>
                    {" "}
                    Mis à jour le :{" "}
                    {new Date(app.lastUpdate).toLocaleDateString()} {"à "}{" "}
                    {new Date(app.lastUpdate).toLocaleTimeString()}
                  </p>

                  <Button
                    onClick={() => setSelectedApp(app)}
                    className="mr-2 mt-2"
                    variant="outline"
                  >
                    Modifier
                  </Button>
                  <Button
                    onClick={() => deleteApp(project.id, app.id)}
                    className="mt-2"
                    variant="destructive"
                  >
                    Supprimer
                  </Button>
                </div>
              ))}
            </div>
          ))}
        </CardContent>
      </Card>

      {selectedApp && (
        <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center">
          <Card className="w-96">
            <CardHeader>
              <h2 className="text-2xl font-semibold">Modifier App</h2>
            </CardHeader>
            <CardContent>
              <Input
                className="mb-4"
                value={selectedApp.title || ""}
                onChange={(e: ChangeEvent<HTMLInputElement>) =>
                  setSelectedApp({ ...selectedApp, title: e.target.value })
                }
                placeholder="Titre de l'app"
              />
              <Input
                className="mb-4"
                value={selectedApp.description || ""}
                onChange={(e: ChangeEvent<HTMLInputElement>) =>
                  setSelectedApp({
                    ...selectedApp,
                    description: e.target.value,
                  })
                }
                placeholder="Description de l'app"
              />
              <Select
                value={selectedApp.device || "web"}
                onValueChange={(value) =>
                  setSelectedApp({
                    ...selectedApp,
                    device: value as DeviceProps,
                  })
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
              <Button onClick={handleUpdateApp} className="mr-2">
                Enregistrer
              </Button>
              <Button onClick={() => setSelectedApp(null)} variant="secondary">
                Annuler
              </Button>
            </CardFooter>
          </Card>
        </div>
      )}
    </div>
  );
};

export default ProjectManager;
