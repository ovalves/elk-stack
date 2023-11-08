import { Router } from 'express'
import { healthStatusController } from '../controller/health-status.controller'

export const routerHealth: Router = Router().get('/', () => healthStatusController())
