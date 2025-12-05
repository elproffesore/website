import { base } from '$app/paths'

export const LinkHandler = (link) => {
  if (process.env.NODE_ENV === 'development') {
    return link
  }

//   if (link === '/') {
//     return base
//   }

  return link
}