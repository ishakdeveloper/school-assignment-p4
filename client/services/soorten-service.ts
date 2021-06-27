import { PlantI } from '../types/models/plant-model'
import { AxiosResponse } from 'axios'
import { api } from '../config/api'

export const getSoorten = async (): Promise<string[]> => {
    return await api.get<string[]>('/soorten').then((res: AxiosResponse<string[]>) => { return res.data })
}