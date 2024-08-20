"use client";
import React, { useState, ChangeEvent } from "react";
import { useAddProject, useAppManagement } from "./hooks";
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

const ProjectAppManagement = () => {
  const { newProjet, handleInputChange, handleAddProjet } = useAddProject();
  const {
    projects,
    selectedProjectTitle,
    setSelectedProjectTitle,
    newApp,
    handleAppInputChange,
    handleAddApp,
    handleUpdateApp,
    handleDeleteApp,
    handleDeleteProject,
  } = useAppManagement();

  const [selectedApp, setSelectedApp] = useState<AppProps | null>(null);

  const handleAppChange = (value: string, field: keyof AppProps) => {
    if (field === "device") {
      handleAppInputChange(field, value as DeviceProps);
    } else {
      handleAppInputChange(field, value);
    }
  };

  const handleSelectedAppChange = (value: string, field: keyof AppProps) => {
    if (selectedApp) {
      if (field === "device") {
        setSelectedApp({ ...selectedApp, [field]: value as DeviceProps });
      } else {
        setSelectedApp({ ...selectedApp, [field]: value });
      }
    }
  };

  return (
    <div className="p-6 max-w-4xl mx-auto">
      <h1 className="text-3xl font-bold mb-6">Gestion des Projets et Apps</h1>

      <Card className="mb-8">
        <CardHeader>
          <h2 className="text-2xl font-semibold">Gestion des projets</h2>
        </CardHeader>
        <CardContent>
          <Select
            value={selectedProjectTitle}
            onValueChange={setSelectedProjectTitle}
          >
            <SelectTrigger className="mb-4">
              <SelectValue placeholder="Sélectionner un projet" />
            </SelectTrigger>
            <SelectContent>
              {projects.map((project) => (
                <SelectItem key={project.title} value={project.title}>
                  {project.title}
                </SelectItem>
              ))}
            </SelectContent>
          </Select>
          <Input
            className="mb-4"
            value={newProjet.title}
            onChange={(e: ChangeEvent<HTMLInputElement>) =>
              handleInputChange("title", e.target.value)
            }
            placeholder="Titre du nouveau projet"
          />
          <Input
            className="mb-4"
            value={newProjet.description}
            onChange={(e: ChangeEvent<HTMLInputElement>) =>
              handleInputChange("description", e.target.value)
            }
            placeholder="Description du nouveau projet"
          />
        </CardContent>
        <CardFooter>
          <Button onClick={handleAddProjet} className="mr-2">
            Ajouter Projet
          </Button>
          {selectedProjectTitle && (
            <Button
              onClick={() => handleDeleteProject(selectedProjectTitle)}
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
          {selectedProjectTitle && (
            <>
              <Input
                className="mb-4"
                value={newApp.title || ""}
                onChange={(e: ChangeEvent<HTMLInputElement>) =>
                  handleAppChange(e.target.value, "title")
                }
                placeholder="Titre de l'app"
              />
              <Input
                className="mb-4"
                value={newApp.description || ""}
                onChange={(e: ChangeEvent<HTMLInputElement>) =>
                  handleAppChange(e.target.value, "description")
                }
                placeholder="Description de l'app"
              />
              <Select
                value={newApp.device || "web"}
                onValueChange={(value) => handleAppChange(value, "device")}
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
          <Button onClick={handleAddApp} disabled={!selectedProjectTitle}>
            Ajouter App
          </Button>
        </CardFooter>
      </Card>

      <Card>
        <CardHeader>
          <h2 className="text-2xl font-semibold">Liste des Projets et Apps</h2>
        </CardHeader>
        <CardContent>
          {projects.map((project) => (
            <div key={project.title} className="mb-6">
              <h3 className="text-xl font-semibold mb-2">{project.title}</h3>
              <p className="mb-2">{project.description}</p>
              <h4 className="text-lg font-semibold mb-2">Apps:</h4>
              {project.apps.map((app) => (
                <div key={app.title} className="ml-4 mb-2">
                  <h5 className="text-md font-semibold">{app.title}</h5>
                  <p>{app.description}</p>
                  {selectedProjectTitle === project.title && (
                    <>
                      <Button
                        onClick={() => setSelectedApp(app)}
                        className="mr-2 mt-2"
                        variant="outline"
                      >
                        Modifier
                      </Button>
                      <Button
                        onClick={() =>
                          handleDeleteApp(project.title, app.title)
                        }
                        className="mt-2"
                        variant="destructive"
                      >
                        Supprimer
                      </Button>
                    </>
                  )}
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
                  handleSelectedAppChange(e.target.value, "title")
                }
                placeholder="Titre de l'app"
              />
              <Input
                className="mb-4"
                value={selectedApp.description || ""}
                onChange={(e: ChangeEvent<HTMLInputElement>) =>
                  handleSelectedAppChange(e.target.value, "description")
                }
                placeholder="Description de l'app"
              />
              <Select
                value={selectedApp.device || "web"}
                onValueChange={(value) =>
                  handleSelectedAppChange(value, "device")
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
              <Button
                onClick={() => {
                  if (selectedApp) {
                    handleUpdateApp(selectedProjectTitle, selectedApp);
                    setSelectedApp(null);
                  }
                }}
                className="mr-2"
              >
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

export default ProjectAppManagement;
