"use client";

import React, { useState } from "react";
import { useProjet } from "@/features/project/useProjet";
import { useApp } from "@/features/app/useApp";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Input } from "@/components/ui/input";
import { Button } from "@/components/ui/button";
import { Calendar, Clock, Search, Edit, Trash, Smartphone } from "lucide-react";

const ProjetList = () => {
  const { projets, getSelectedProjet } = useProjet();
  const { getAppsForProject, deleteApp } = useApp();
  const [searchTerm, setSearchTerm] = useState("");
  const [currentPage, setCurrentPage] = useState(1);
  const projectsPerPage = 3;

  const filteredProjects = projets.filter((projet) =>
    projet.title.toLowerCase().includes(searchTerm.toLowerCase())
  );

  const indexOfLastProject = currentPage * projectsPerPage;
  const indexOfFirstProject = indexOfLastProject - projectsPerPage;
  const currentProjects = filteredProjects.slice(
    indexOfFirstProject,
    indexOfLastProject
  );

  const paginate = (pageNumber: number) => setCurrentPage(pageNumber);
  const selecteProjet = getSelectedProjet();

  return (
    <div className="p-6 max-w-4xl mx-auto">
      <h1 className="text-3xl font-bold mb-6">Liste des Projets</h1>

      <Card className="mb-8">
        <CardHeader>
          <CardTitle>Rechercher un projet</CardTitle>
        </CardHeader>
        <CardContent>
          <div className="relative">
            <Input
              type="text"
              placeholder="Entrez le nom du projet..."
              value={searchTerm}
              onChange={(e) => setSearchTerm(e.target.value)}
              className="pl-10"
            />
            <Search
              className="absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400"
              size={20}
            />
          </div>
          <div>Selected project: {selecteProjet?.title}</div>
        </CardContent>
      </Card>

      {currentProjects.map((projet) => (
        <Card
          key={projet.id}
          className="mb-8 hover:shadow-lg transition-shadow duration-300"
        >
          <CardHeader>
            <CardTitle>{projet.title}</CardTitle>
          </CardHeader>
          <CardContent>
            <p className="text-gray-600 mb-4">{projet.description}</p>
            <div className="flex items-center text-sm text-gray-500 mb-2">
              <Calendar className="mr-2" size={16} />
              <span>
                Créé le : {new Date(projet.dateOfCreation).toLocaleDateString()}
              </span>
            </div>
            <div className="flex items-center text-sm text-gray-500 mb-4">
              <Clock className="mr-2" size={16} />
              <span>
                Mis à jour le :{" "}
                {new Date(projet.lastUpdate).toLocaleDateString()}
              </span>
            </div>

            <div className="flex items-center text-sm text-gray-500 mb-4">
              id :<span>{projet.id}</span>
            </div>

            <h3 className="text-lg font-semibold mb-2">Apps du projet:</h3>
            {getAppsForProject(projet.id).map((app) => (
              <Card key={app.id} className="mb-2 p-3">
                <div className="flex justify-between items-center">
                  <div>
                    <h4 className="font-medium">{app.title}</h4>
                    <p className="text-sm text-gray-500">{app.description}</p>
                  </div>
                  <div className="flex items-center">
                    <Smartphone className="mr-2" size={16} />
                    <span className="text-sm">{app.device}</span>
                    <Button
                      variant="ghost"
                      size="sm"
                      className="ml-2"
                      onClick={() => deleteApp(projet.id, app.id)}
                    >
                      <Trash size={16} />
                    </Button>
                  </div>
                </div>
              </Card>
            ))}
          </CardContent>
        </Card>
      ))}

      {filteredProjects.length > projectsPerPage && (
        <div className="flex justify-center mt-6">
          {Array.from(
            { length: Math.ceil(filteredProjects.length / projectsPerPage) },
            (_, i) => (
              <Button
                key={i}
                onClick={() => paginate(i + 1)}
                variant={currentPage === i + 1 ? "default" : "outline"}
                className="mx-1"
              >
                {i + 1}
              </Button>
            )
          )}
        </div>
      )}
    </div>
  );
};

export default ProjetList;
