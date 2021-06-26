import { PlantI } from '../types/models/plant-model'
import axios, { AxiosResponse } from 'axios'

const api = axios.create({
    baseURL: 'http://localhost:4000'
})

export const getPlants = async (): Promise<PlantI[]> => {
    return await api.get<PlantI[]>('/plants').then((response: AxiosResponse<PlantI[]>) => { return response.data })
}

export const addPlant = async (payload: PlantI): Promise<PlantI[]> => {
    return await api.post<PlantI[]>('/plants/create', payload).then((response: AxiosResponse<PlantI[]>) => { return response.data })
}

export const updatePlant = async (id: number, payload: PlantI): Promise<PlantI[]> => {
    return await api.put<PlantI[]>(`/plants/update/${id}`, payload).then((response: AxiosResponse<PlantI[]>) => { return response.data })
}

export const deletePlant = async (id: number) => {
    return await api.delete<PlantI[]>(`/plants/delete/${id}`)
}