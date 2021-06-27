import { PlantI } from '../types/models/plant-model'
import { AxiosResponse } from 'axios'
import { api } from '../config/api'

export const getColors = async (): Promise<string[]> => {
    return await api.get<string[]>('/colors').then((res: AxiosResponse<string[]>) => { return res.data })
}